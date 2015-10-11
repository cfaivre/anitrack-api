require_relative '../spec_helper'

describe "stock take" do

  before :each do
    Helpers::Cleanup.all
    Helpers::Setup.all
  end

  it "lists all stock takes" do
    Helpers::Setup.stock_takes
    get '/api/stock-takes', {}, json_header

    expect(last_response.status).to eq 200
    response = JSON.parse(last_response.body)
    expect( response.count ).to eq 2
    expect( response.first['items'] ).to eq [ "2015052900000000000000000000ABE2", "2015052900000000000000000000ABD1",
                                              "20150529000000008FF92F2500000000", "2015052900000000000000000000ABD6",
                                              "2015052900000000000000000000ABD3", "2015052900000000000000000000ABD5" ]
  end

  it "creates a new stock take" do
    rfids = ['2015052900000000000000000000ABD3','2015052900000000000000000000ABD5', '2015052900000000000000000000ABCF']
    put '/api/stock_take', { device_id: 'c4:6a:b7:f2:6e:a3', rfids: rfids }.to_json, {}
    expect(last_response.status).to eq 200
    response = JSON.parse(last_response.body)
    expect( StockTake.all.count ).to eq 1
    expect( StockTake.first.items ).to match_array( rfids )
    expect( StockTake.first.device_id ).to eq 'c4:6a:b7:f2:6e:a3'
  end

  it "creates a new stock take from a resberry pi" do
    rfids = '2015052900000000000000000000ABD3\n2015052900000000000000000000ABD5\n2015052900000000000000000000ABCF'
    put '/api/stock_take/pi', { rfids: rfids }, {}
    expect(last_response.status).to eq 200
    response = JSON.parse(last_response.body)
    expect( StockTake.all.count ).to eq 1
    expect( StockTake.first.items ).to match_array( rfids.lines.map(&:chomp) )
  end
end
