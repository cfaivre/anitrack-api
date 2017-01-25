require 'json'

class AnitrackApiApp < Sinatra::Base

  get '/animal/view/all' do
    content_type :json
    result = nil
    begin
      result = Animal.all
      halt 200, {data: result}.to_json
    rescue Animal::Error => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end

  get '/animal/view' do
    content_type :json
    result = nil
    begin
      result = Animal.find_by_id(params['id'])
      halt 200, {data: result}.to_json
    rescue Animal::Error => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end
end

#given an animal mongo id, provide the details including the life envets of the animal
#given an animal tag id, provide the details including the life envets of the animal
