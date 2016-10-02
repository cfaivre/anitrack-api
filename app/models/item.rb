class ItemError < StandardError; end
class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  field :expire_date,           type: Date
  field :location,              type: String
  field :manufacture_date,      type: Date
  field :project_name,          type: String
  field :purchase_order_number, type: String
  field :rfid,                  type: String
  field :sap_number,            type: String
  field :supplier,              type: String
  #field :serial_number,         type: String
  field :storage_location,      type: String
 # field :status,                type: String

  validates_uniqueness_of :rfid
  #validates_uniqueness_of :serial_number
  #validates :status, inclusion: { in: ['initialized', 'accepted', 'unaccepted'], message: "%{value} is not a valid status" }

  def self.import( overwrite, items )
    Item.delete_all if overwrite
    items.each do |item|
      Item.create!( rfid: item[:rfid],
                    sap_number: item[:sap_number],
                    location: item[:location],
                    purchase_order_number: item[:purchase_order_number],
                    supplier: item[:supplier],
                    expire_date: item[:expire_date],
                    manufacture_date: item[:manufacture_date] );
    end
  end

  def self.issue(rfids, location, project_name, sloc)
    rfids.each { |rfid|
        Item.where( rfid: rfid ).set( location: location ) unless location.nil?
        Item.where( rfid: rfid ).set( project_name: project_name ) unless project_name.nil?
        Item.where( rfid: rfid ).set( storage_location: sloc ) unless sloc.nil?
    }
  end

  def self.issued(params)
    cncs = Cnc.all.map{|c| c.name}
    Item.where( :location.in=>cncs )
  end

  def self.non_issued(params)
    warehouses = Warehouse.all.map{|c| c.name}
    Item.where( :location.in=> (warehouses<<'supplier') )
  end

  def scanned( params )
    params[:rfids].each { |rfid|
      Item.where( rfid: rfid ).set( location: params[:reader], status: 'unaccepted' )
    }
  end

end
