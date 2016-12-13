require 'json'

class AnitrackApiApp < Sinatra::Base

  get '/db/repopulate' do
    Animal.delete_all
    LifeEvent.delete_all
    Animal.create!( date_of_birth: Date.today, location: {},
                    status: 'alive', tag_number: 'zaQifQAahXHl,A12,18475',
                    uuid: SecureRandom.uuid )
    Animal.create!( date_of_birth: Date.today, location: {},
                    status: 'alive', tag_number: 'zaQifQAahBAS,A12,25431',
                    uuid: SecureRandom.uuid )
    Animal.create!( date_of_birth: Date.today, location: {},
                    status: 'alive', tag_number: 'zaQifQAahAAA,A12,101156',
                    uuid: SecureRandom.uuid )
    Animal.create!( date_of_birth: Date.today, location: {},
                    status: 'alive', tag_number: 'zaQifQAahRRR,A12,86433',
                    uuid: SecureRandom.uuid )
    halt 200, {message: 'success'}.to_json
  end
end
