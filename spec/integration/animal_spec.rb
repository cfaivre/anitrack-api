require_relative '../spec_helper'

describe "animal" do

  before :each do
    Helpers::Cleanup.all
    Helpers::Setup.all
  end

  it "lists all animals" do
    get '/animal/view/all', {}, json_header

    expect(last_response.status).to eq 200
    expect(JSON.parse(last_response.body).count).to eq 1
  end

end
