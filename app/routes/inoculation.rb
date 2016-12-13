require 'json'

class AnitrackApiApp < Sinatra::Base

  get '/api/inoculations' do
    content_type :json
    result = nil
    begin
      result = Inoculation.all
      halt 200, result.to_json
    rescue Inoculation::Error => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end
end
