module Helpers
  module Setup
    def self.all
      inoculations
      animals
      life_events
    end

    def self.inoculations
      Inoculation.create!( name: 'against-new-castle' )
    end

    def self.animals
      Animal.create!( date_of_birth: Date.today, location: {},
                      status: 'alive', tag_number: 'zaQifQAahXHl,A12,18475',
                      uuid: SecureRandom.uuid )
    end

    def self.life_events
      LifeEvent.create!( animals: ['zaQifQAahXHl,A12,18475'], description: 'Move to abbatoir', location: {x: -73.974, y: 40.741895},
                         jobtype: 'transport', status: 'in-transit' )
    end
  end
end
