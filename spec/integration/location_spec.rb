require_relative '../spec_helper'

describe "location" do

  before :each do
    Helpers::Cleanup.all
    Helpers::Setup.all
  end

  it "lists all locations" do
    get '/api/locations', {}, json_header
    expect(last_response.status).to eq 200
    body = JSON.parse(last_response.body)
    expect(body.count).to eq 28
    expect(body.first['name']).to eq 'airport'
    expect(body.last['name']).to eq 'worcester'
  end

end
