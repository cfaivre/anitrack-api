class StockTakeError < StandardError; end
class StockTake
  include Mongoid::Document
  include Mongoid::Timestamps

  field :device_id, type: String
  field :items, type: Array
  field :stats, type: Hash

  def self.upload( device_id, items, from_pi )
    stats = {}
    items = items.lines.map(&:chomp) if from_pi
    items.map{|item|
      Item.where(rfid: item).map{ |x|
        if ( stats[x.sap_number].nil? )
          stats[x.sap_number] = 1
        else
          stats[x.sap_number] += 1
        end
      }
    }
    stock_take = StockTake.create!( device_id: device_id, items: items, stats: stats )
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
