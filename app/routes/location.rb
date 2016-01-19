require 'cgi'
require 'json'

class StockApiApp < Sinatra::Base

  get '/api/locations' do
    content_type :json
    result = nil
    begin
      result = Location.all + Cnc.all + Warehouse.all
      halt 200, result.to_json
    rescue LocationError => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end
end
