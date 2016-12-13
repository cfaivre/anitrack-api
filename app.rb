require 'sinatra/base'
require 'jsender'
require 'mongoid'

require_relative './app/models/animal'
require_relative './app/models/inoculation'
require_relative './app/models/life_event'
Dir[File.join(File.dirname(__FILE__), "/app/routes/*.rb")].each {|file| require file }

module BSON
  class ObjectId
    alias :to_json :to_s
    alias :as_json :to_s
  end
end

class AnitrackApiApp < Sinatra::Base

  Mongoid.load!('config/mongoid.yml')

  before do
    headers 'Access-Control-Allow-Headers' => 'Origin, X-Requested-With, Content-Type, Accept',
            'Access-Control-Allow-Methods' => 'GET, HEAD, OPTIONS, POST',
            'Access-Control-Allow-Origin' => '*'
  end

  options '/*.*' do
    ''
  end

end
