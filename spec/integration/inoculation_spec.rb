require_relative '../spec_helper'

describe "inoculation" do

  before :each do
    Helpers::Cleanup.all
    Helpers::Setup.all
  end

  it "lists all inoculations" do
    get '/api/inoculations', {}, json_header

    expect(last_response.status).to eq 200
    expect(JSON.parse(last_response.body).count).to eq 1
  end

end
