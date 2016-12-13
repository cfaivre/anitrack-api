module Helpers
  module Cleanup
    def self.all
      inoculations
      animals
      life_events
    end

    def self.inoculations
      Inoculation.delete_all
    end

    def self.animals
      Animal.delete_all
    end

    def self.life_events
      LifeEvent.delete_all
    end

  end
end
