require_relative '../spec_helper'

describe "location" do

  before :each do
    Helpers::Cleanup.all
    Helpers::Setup.all
  end

  it "lists all locations" do
    get '/api/locations', {}, json_header

    expect(last_response.status).to eq 200
    expect(JSON.parse(last_response.body).count).to eq 28
  end

end
