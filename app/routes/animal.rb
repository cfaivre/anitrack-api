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
      if params.include?('tag')
        result = Animal.find_by_tag(params['tag'])
      elsif params.include?('uuid')
        result = Animal.find_by_uuid(params['uuid'])
      else
        result = Animal.find_by_id(params['id'])
      end
      halt 200, {data: result}.to_json
    rescue Animal::Error => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end
end
