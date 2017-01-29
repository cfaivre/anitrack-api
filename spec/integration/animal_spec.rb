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

  it "lists the details and life events of an animal given an animal's id" do
    animal = Animal.first
    animal_id = animal.id.to_s
    get "/animal/view?id=#{animal_id}", {}, json_header

    expect(last_response.status).to eq 200
    expect(JSON.parse(last_response.body).count).to eq 1
    response_data = JSON.parse(last_response.body)['data']
    expect(response_data['tag_number']).to eq animal.tag_number
    expect(response_data['life_events'].class).to eq Array
    #TODO: more expectations of other fields
  end

  it "lists the details and life events of an animal given an animal's tag number" do
    animal = Animal.first
    animal_tag = animal.tag_number
    get "/animal/view?tag=#{animal_tag}", {}, json_header

    expect(last_response.status).to eq 200
    expect(JSON.parse(last_response.body).count).to eq 1
    response_data = JSON.parse(last_response.body)['data']
    expect(response_data['tag_number']).to eq animal.tag_number
    expect(response_data['life_events'].class).to eq Array
    #TODO: more expectations of other fields
  end

  it "lists the details and life events of an animal given an animal's uuid" do
    animal = Animal.first
    animal_uuid = animal.uuid
    get "/animal/view?uuid=#{animal_uuid}", {}, json_header

    expect(last_response.status).to eq 200
    expect(JSON.parse(last_response.body).count).to eq 1
    response_data = JSON.parse(last_response.body)['data']
    expect(response_data['tag_number']).to eq animal.tag_number
    expect(response_data['life_events'].class).to eq Array
    #TODO: more expectations of other fields
  end

end
