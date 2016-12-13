require_relative '../spec_helper'

describe "life event" do

  before :each do
   # Helpers::Cleanup.all
   # Helpers::Setup.all
   LifeEvent.delete_all
   @lifeevent = LifeEvent.create!( animal_tag: 'zaQifQAahXHl,A12,18475', description: 'Move to abbatoir', location: {x: -73.974, y: 40.741895},
                                  jobtype: 'transport', status: 'in-transit' )
  end

  it "lists all life events" do
    get '/event/view/all', {}, json_header

    expect(last_response.status).to eq 200
    expect(JSON.parse(last_response.body).count).to eq 1
  end

  it "lists a specific life event" do
    get "/event/view/#{@lifeevent.id}", {}, json_header

    expect(last_response.status).to eq 200
    response_body = JSON.parse(last_response.body)
    expect(response_body['animal_tag']).to eq 'zaQifQAahXHl,A12,18475'
  end

  it "creates a life event" do
    LifeEvent.delete_all
    animal_tags = ['zaQifQAahXHl,A12,18475', 'zaQifQAahBAS,A12,25431', 'zaQifQAahAAA,A12,101156', 'zaQifQAahRRR,A12,86433']
    post_data = { animals: animal_tags,
                  description: 'Move to abbatoir', location: {x: -73.974, y: 40.741895},
                  jobtype: 'transport', status: 'in-transit' }
    post '/event/create', post_data.to_json, json_header

    expect(last_response.status).to eq 200
    esponse = JSON.parse(last_response.body)
    expect( LifeEvent.all.count ).to eq 4
    expect( LifeEvent.first.animal_tag ).to eq 'zaQifQAahXHl,A12,18475'
    expect( LifeEvent.last.animal_tag ).to eq 'zaQifQAahRRR,A12,86433'
    expect( LifeEvent.first.description ).to eq 'Move to abbatoir'
    expect( LifeEvent.first.location ).to eq ({'x'=> -73.974, 'y'=> 40.741895})
    expect( LifeEvent.first.jobtype ).to eq 'transport'
    expect( LifeEvent.first.status ).to eq 'in-transit'
  end

end
