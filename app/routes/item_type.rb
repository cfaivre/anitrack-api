require 'cgi'
require 'json'

class StockApiApp < Sinatra::Base

  get '/api/item-types' do
    content_type :json
    result = nil
    begin
      result = ItemType.where(params)
      halt 200, result.to_json
    rescue ItemTypeError => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end

  post '/api/item-type/import' do
    content_type :json
    body_params = JSON.parse(request.body.read, :symbolize_names => true)
    begin
      result = ItemType.import( body_params[:overwrite], body_params[:item_types] )
      halt 200, result.to_json
    rescue ItemTypeError => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end
end
