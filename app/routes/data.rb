require 'json'

class AnitrackApiApp < Sinatra::Base

  get '/db/repopulate' do
    Animal.delete_all
    LifeEvent.delete_all
    Animal.create!( date_of_birth: Date.today, location: {},
                    status: 'alive', tag_number: 'za4cbMOhMNjh,A12,35026',
                    uuid: SecureRandom.uuid )
    Animal.create!( date_of_birth: Date.today, location: {},
                    status: 'alive', tag_number: 'zaCm5vKmkMsL,A09,29320',
                    uuid: SecureRandom.uuid )
    Animal.create!( date_of_birth: Date.today, location: {},
                    status: 'alive', tag_number: 'za70nKNVdd7c,A14,7198',
                    uuid: SecureRandom.uuid )
    Animal.create!( date_of_birth: Date.today, location: {},
                    status: 'alive', tag_number: 'zapvxvCvPM4o,A14,82883',
                    uuid: SecureRandom.uuid )
    Animal.create!( date_of_birth: Date.today, location: {},
                    status: 'alive', tag_number: 'zaFbRVsGlDB7,A14,72326',
                    uuid: SecureRandom.uuid )

    LifeEvent.create!( animals: ['za4cbMOhMNjh,A12,35026','zaCm5vKmkMsL,A09,29320','za70nKNVdd7c,A14,7198',
                                 'zapvxvCvPM4o,A14,82883','zaFbRVsGlDB7,A14,72326'], description: 'new borns', location: {x: -73.974, y: 40.741895},
                                               jobtype: 'birth', status: 'alive' )
    halt 200, {message: 'success'}.to_json
  end
end
