require 'cgi'
require 'json'

class StockApiApp < Sinatra::Base

  get '/api/stock-takes' do
    content_type :json
    result = nil
    begin
      result = StockTake.where(params)
      halt 200, result.to_json
    rescue StockTakeError => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end

  put '/api/stock_take/pi' do
    begin
      result = StockTake.upload( 'unknown', params['rfids'], true )
      halt 200, result.to_json
    rescue StockTakeError => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end

  put '/api/stock_take' do
    content_type :json
    body_params = JSON.parse(request.body.read, :symbolize_names => true)
    begin
      result = StockTake.upload( body_params[:device_id], body_params[:rfids], false )
      halt 200, result.to_json
    rescue StockTakeError => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end
end
