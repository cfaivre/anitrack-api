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

  def self.import( overwrite, item_types )
    ItemType.delete_all if overwrite
    item_types.each do |item_type|
      ItemType.create!( sap_number: item_type[:sap_number],
                        material_type: item_type[:material_type],
                        description: item_type[:description],
                        image: item_type[:image]);
    end
  end

end
