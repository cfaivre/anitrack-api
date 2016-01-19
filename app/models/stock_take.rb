class StockTakeError < StandardError; end
class StockTake
  include Mongoid::Document
  include Mongoid::Timestamps

  field :device_id, type: String
  field :items, type: Array
  field :physical_count, type: Hash
  field :inventory_quantity, type: Hash
  field :expired, type: Hash

  def self.upload( device_id, items, from_pi )
    physical_count = {}; inventory_quantity = {}; expired = {}
    items = items.lines.map(&:chomp) if from_pi
    items.map{|item|
      Item.where(rfid: item).map{ |x|
        inventory_quantity[x.sap_number] = 0
        expired[x.sap_number] = false
        if ( physical_count[x.sap_number].nil? )
          physical_count[x.sap_number] = 1
        else
          physical_count[x.sap_number] += 1
        end
      }
    }

    inventory_quantity.each{|sap_number, quantity|
      count = Item.where(sap_number: sap_number).count
      inventory_quantity[sap_number] = count
    }

    expired.each{|sap_number, expired|
      count = Item.where(sap_number: sap_number, :expiry_date.gt => Date.today).count
      expired[sap_number] = true if count > 0
    }

    stock_take = StockTake.create!( device_id: device_id, items: items, physical_count: physical_count, inventory_quantity: inventory_quantity, expired: expired )
    #generate_pdf( stock_take.id.to_json, stock_take.created_at, stats )
    stock_take
  end

  def self.generate_pdf( id, date, data )
    require "prawn/table"
    pdf = Prawn::Document.new
    pdf.text( "Stock Level Report: #{Time.parse( date.to_s ).strftime('%Y/%m/%d %H:%M')}" )
    contents = [ [ { content: 'SAP number'},
                   { content: 'Description'},
                   { content: 'Quantity'} ] ]
    data.each do |k, v|
      item_type = ItemType.where(sap_number: k).first
      contents +=  [ [ { content: k},
                       { content: item_type.description.to_s},
                       { content: v.to_s } ] ]
    end
    pdf.table( contents )
    pdf.render_file File.join(File.dirname(__FILE__), "/../pdfs/#{id}.pdf")
  end

end
