class Inoculation
  class Error < StandardError; end
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

end
