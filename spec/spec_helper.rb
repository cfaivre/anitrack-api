ENV['RACK_ENV'] = 'test'
require 'simplecov'
SimpleCov.start
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require File.join(File.dirname(__FILE__), '/helpers/init.rb')

require 'sinatra'
require 'rack/test'
require 'json'

def app
  Rack::Builder.new do
    map '/' do
      run AnitrackApiApp.new
    end
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def json_header
  { 'ACCEPT' => 'application/json', "CONTENT_TYPE" => "application/json"}
end

def image_header
  { 'ACCEPT' => 'application/', "CONTENT_TYPE" => "application/"}
end

def plain_header
  { 'ACCEPT' => 'text/plain', 'CONTENT_TYPE' => 'text/html' }
end

# VCR
require 'webmock/rspec'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end
