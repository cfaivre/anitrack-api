class ItemError < StandardError; end
class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  field :location,              type: String
  field :project_name,          type: String
  field :manufacture_date,      type: Date
  field :expire_date,           type: Date
  field :rfid,                  type: String
  field :purchase_order_number, type: String
  field :sap_number,            type: String
  field :description,           type: String
  #field :serial_number,         type: String
  #field :storage_location,      type: String
 # field :status,                type: String

  validates_uniqueness_of :rfid
  #validates_uniqueness_of :serial_number
  #validates :status, inclusion: { in: ['initialized', 'accepted', 'unaccepted'], message: "%{value} is not a valid status" }

  def self.issue(rfids, location, project_name)
    rfids.each { |rfid|
        Item.where( rfid: rfid ).set( location: location ) unless location.nil?
        Item.where( rfid: rfid ).set( project_name: project_name ) unless project_name.nil?
    }
  end

  def scanned( params )
    params[:rfids].each { |rfid|
      Item.where( rfid: rfid ).set( location: params[:reader], status: 'unaccepted' )
    }
  end

end
