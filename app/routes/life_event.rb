require 'json'

class AnitrackApiApp < Sinatra::Base

  get '/event/view/all' do
    content_type :json
    result = nil
    begin
      result = LifeEvent.all
      halt 200, {data: result}.to_json
    rescue LifeEvent::Error => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end

  get '/event/view/:id' do
    content_type :json
    result = nil
    begin
      result = LifeEvent.where(id: params['id']).first
      halt 200, {data: result}.to_json
    rescue LifeEvent::Error => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
      return result.to_json
  end

  post '/event/create' do
    params = JSON.parse(request.body.read, :symbolize_names => true)
#    params[:animals].each do |animal_tag|
#      life_params = params.tap { |param| param.delete(:animals) }
#      life_params.merge!({animal_tag: animal_tag})
#      LifeEvent.create!(life_params)
#    end
    LifeEvent.create!(params)
    begin
      { message: 'success' }.to_json
    rescue LifeEvent::Error => e
      status 422 and { message: e.message }.to_json
    end
  end

end
