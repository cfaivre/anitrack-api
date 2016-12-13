require 'securerandom'

class Animal
  class Error < StandardError; end
  include Mongoid::Document
  include Mongoid::Timestamps

  field :date_of_birth, type: Date
  field :location, type: Hash
  field :status, type: String
  field :tag_number, type: String
  field :uuid, type: String

  validates_uniqueness_of :uuid

end
