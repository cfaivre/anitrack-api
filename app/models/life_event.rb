require 'securerandom'

class LifeEvent
  class Error < StandardError; end
  include Mongoid::Document
  include Mongoid::Timestamps

  field :animal_tag, type: String
  field :description, type: String
  field :location, type: Hash
  field :jobtype, type: String
  field :status, type: String

end
