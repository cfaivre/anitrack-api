require 'cgi'
require 'json'
require 'uri'

class StockApiApp < Sinatra::Base

  get '/api/items' do
    content_type :json
    result = nil
    begin
      result = Item.where(params)
      halt 200, result.to_json
    rescue ItemError => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end

  get '/api/items/non-issued' do
    content_type :json
    result = nil
    begin
      result = Item.non_issued(params)
      halt 200, result.to_json
    rescue ItemError => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end

  get '/api/items/issued' do
    content_type :json
    result = nil
    begin
      result = Item.issued(params)
      halt 200, result.to_json
    rescue ItemError => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end

  get '/api/items-per-location' do
    content_type :json
    result = nil
    begin
      items_locations = Item.where(params).group_by(&:location)
      result = items_locations.map{|k,v| {location: k, quantity: v.count} }
      halt 200, result.to_json
    rescue ItemError => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end

  get '/api/items/detail' do
    content_type :json
    params.merge!(CGI.parse(request.query_string).symbolize_keys)
    items = []
    rfids = params[:rfids]
    Item.where(:rfid.in => rfids).each do |item|
      items << item
    end
    items.to_json
  end

  post '/api/items/arrive' do
    params = JSON.parse(request.body.read, :symbolize_names => true)
    begin
      params[:rfids].each { |rfid|
        Item.where( rfid: rfid ).set( location: params[:location] )
      }
      { message: 'success' }.to_json
    rescue ItemError => e
       status 422 and { message: e.message }.to_json
    end
  end

  post '/api/items/issue' do
    params = JSON.parse(request.body.read, :symbolize_names => true)
    begin
      Item.issue(params[:rfids], params[:location], params[:project_name], params[:sloc])
      { message: 'success' }.to_json
    rescue ItemError => e
       status 422 and { message: e.message }.to_json
    end
  end

  post '/api/items/locations' do
    params = JSON.parse(request.body.read, :symbolize_names => true)
    begin
      params[:rfids].each { |rfid|
        Item.where( rfid: rfid ).set( location: params[:new_location] )
        Item.where( rfid: rfid ).set( storage_location: params[:new_storage_location] )
      }
      { message: 'success' }.to_json
    rescue ItemError => e
       status 422 and { message: e.message }.to_json
    end
  end

  post '/api/items/scanned' do
    body = parse_scanned_items( request.body.read )
    begin
      Item.new.scanned( { rfids: body[:rfids], reader: body[:reader] } )
      { message: 'success' }.to_json
    rescue ItemError => e
       status 422 and { message: e.message }.to_json
    end
  end

  def parse_scanned_items( body )
    uri_body = URI.decode( body )
    cgi_body = CGI::parse( uri_body )
    reader = cgi_body['reader_name'][0].gsub(/\"/,'')
    rfids = cgi_body['field_values'][0].split( /\n/ ).map{ |x| x.gsub(/\"/,'') }.uniq
    { reader: reader, rfids: rfids}
  end
end
