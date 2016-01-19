class ItemTypeError < StandardError; end
class ItemType
  include Mongoid::Document

  field :description,           type: String
  field :image,                 type: String
  field :material_type,         type: String
  field :rating,                type: String
  field :sap_number,            type: String
  #field :color,                 type: String

  validates_uniqueness_of :sap_number

end
