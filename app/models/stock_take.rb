class StockTakeError < StandardError; end
class StockTake
  include Mongoid::Document
  include Mongoid::Timestamps

  field :device_id, type: String
  field :items, type: Array
  field :stats, type: Hash
  field :location, type: String

  def self.upload( device_id, items, from_pi )
    stats={}; physical_count = {}; inventory_quantity = {}; expired = {}
    items = items.lines.map(&:chomp) if from_pi
    stats = Item.where(:rfid.in=>items).group_by{|i|i.sap_number}
    # calculate physical counted quantity
    stats.each{|k, v|
      stats[k] = {physical_count: v.count}
    }
    # calculate inventory quantity
    stats.each{|k, v|
      count = Item.where(sap_number: k).count
      stats[k].merge!({inventory_quantity: count})
    }
    # calculate discrepency
    stats.each{|k,v|
      discrepency = stats[k][:physical_count] - stats[k][:inventory_quantity]
      stats[k].merge!({discrepency: discrepency.abs})
    }
    # expired items
    stats.each{|k,v|
      stats[k].merge!({expired: false})
    }
    expired_items = Item.where(:rfid.in=>items, :expire_date.lt => Date.today)
    expired_items.each{|i|
      stats[i.sap_number][:expired] = true
    }
    stats
    #location
    location = YAML.load_file( File.join(File.dirname(__FILE__), '../../config/devices.yml') )[ENV['RACK_ENV']][device_id]

    stock_take = StockTake.create!( device_id: device_id, items: items, stats: stats, location: location)
    generate_pdf( stock_take.id.to_json, stock_take.created_at, stats )
    stock_take
  end

  def self.generate_pdf( id, date, data )
    require "prawn/table"
    pdf = Prawn::Document.new
    pdf.text( "Stock Level Report: #{Time.parse( date.to_s ).strftime('%Y/%m/%d %H:%M')}" )
    contents = [ [ { content: 'SAP number'},
                   { content: 'Description'},
                   { content: 'Physical Count'},
                   { content: 'Inventory Quantity'},
                   { content: 'Discrepency'} ] ]
    data.each do |k, v|
      item_type = ItemType.where(sap_number: k).first
      contents +=  [ [ { content: k},
                       { content: item_type.description.to_s},
                       { content: [:physical_count].to_s },
                       { content: [:inventory_quantity].to_s },
                       { content: [:discrepency].to_s } ] ]
    end
    pdf.table( contents )
    pdf.render_file File.join(File.dirname(__FILE__), "/../pdfs/#{id}.pdf")
  end

end
