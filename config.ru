require File.join(File.dirname(__FILE__), 'app.rb')

app = Rack::Builder.new do
  map '/ping' do
    run ->(env) { [200, {'Content-Type' => 'text/plain'}, ['PONG']] }
  end
  map '/' do
    run AnitrackApiApp.new
  end
end

run app
