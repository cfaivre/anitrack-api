require_relative '../spec_helper'

describe "item_type" do

  before :each do
    Helpers::Cleanup.all
    Helpers::Setup.all
  end

  it "lists all item_types" do
    get '/api/item-types', {}, json_header

    expect(last_response.status).to eq 200
    expect(JSON.parse(last_response.body).count).to eq 2
  end

  it "imports given item_types" do
    item_types = [ { sap_number: '164584', material_type: 'wooden pole',
                     description: 'POLE,WOOD 18.0X180-199 TOP DIA     D0048',
                     image: './img/pole_white.jpg' },
                   { sap_number: '164585', material_type: 'wooden pole',
                     description: 'POLE,WOOD 18.0X180-199 TOP DIA     D0048',
                     image: './img/pole_purple.jpg' },
                 ]
    post '/api/item-type/import', {overwrite: true, item_types: item_types}.to_json, json_header
    expect(last_response.status).to eq 200
    body = JSON.parse(last_response.body, symbolize_names: true)
    expect(body.count).to eq 2
    expect(body).to eq item_types
  end
end
