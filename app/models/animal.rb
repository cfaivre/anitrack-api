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

  def self.find_by_id(id)
    animal = Animal.find(id)
    life_events = LifeEvent.where( animals: { '$in': [ animal.tag_number ] } )
    formatted_life_events = life_events.map{|life_event| { created_at: life_event[:created_at], description: life_event[:description],
                                                           jobtype: life_event[:jobtype], location: life_event[:location],
                                                           status: life_event[:status] } }
    { date_of_birth: animal.date_of_birth,
      location: animal.location,
      status: animal.status,
      tag_number: animal.tag_number,
      uuid: animal.uuid,
      life_events: formatted_life_events }

#    {"data"=>[{"_id"=>"58890918088b2555327bee66", "animals"=>["zaQifQAahXHl,A12,18475"], "created_at"=>"2017-01-25T22:22:48.207+02:00", "description"=>"Move to abbatoir", "jobtype"=>"transport", "location"=>{"x"=>-73.974, "y"=>40.741895}, "status"=>"in-transit", "updated_at"=>"2017-01-25T22:22:48.207+02:00"}]}

  end

end
