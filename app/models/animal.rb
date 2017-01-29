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
    formatted_life_events = life_events.map{|life_event| { created_at: life_event.created_at, description: life_event.description,
                                                           jobtype: life_event.jobtype, location: life_event.location,
                                                           status: life_event.status, id: life_event.id.to_s } }
    { id: animal.id.to_s,
      date_of_birth: animal.date_of_birth,
      location: animal.location,
      status: animal.status,
      tag_number: animal.tag_number,
      uuid: animal.uuid,
      life_events: formatted_life_events }
  end

  def self.find_by_tag(tag)
    animal = Animal.where(tag_number: tag).first
    life_events = LifeEvent.where( animals: { '$in': [ animal.tag_number ] } )
    formatted_life_events = life_events.map{|life_event| { created_at: life_event.created_at, description: life_event.description,
                                                           jobtype: life_event.jobtype, location: life_event.location,
                                                           status: life_event.status, id: life_event.id.to_s } }
    { id: animal.id.to_s,
      date_of_birth: animal.date_of_birth,
      location: animal.location,
      status: animal.status,
      tag_number: animal.tag_number,
      uuid: animal.uuid,
      life_events: formatted_life_events }
  end

  def self.find_by_uuid(uuid)
    animal = Animal.where(uuid: uuid).first
    life_events = LifeEvent.where( animals: { '$in': [ animal.tag_number ] } )
    formatted_life_events = life_events.map{|life_event| { created_at: life_event.created_at, description: life_event.description,
                                                           jobtype: life_event.jobtype, location: life_event.location,
                                                           status: life_event.status, id: life_event.id.to_s } }
    { id: animal.id.to_s,
      date_of_birth: animal.date_of_birth,
      location: animal.location,
      status: animal.status,
      tag_number: animal.tag_number,
      uuid: animal.uuid,
      life_events: formatted_life_events }
  end

end
