require_relative '../spec_helper'

describe "item" do

  before :each do
    Helpers::Cleanup.all
    Helpers::Setup.all
  end

  it "lists all items" do
    get '/api/items', {}, json_header

    expect(last_response.status).to eq 200
    expect(JSON.parse(last_response.body).count).to eq 12
  end

  it "lists all items at a warehouse or supplier" do
    get '/api/items/non-issued', {}, json_header

    expect(last_response.status).to eq 200
    expect(JSON.parse(last_response.body).count).to eq 11
    expect(JSON.parse(last_response.body).first['location']).to eq 'supplier'
  end

  it "lists all items at a cnc" do
    get '/api/items/issued', {}, json_header

    expect(last_response.status).to eq 200
    expect(JSON.parse(last_response.body).count).to eq 1
    expect(JSON.parse(last_response.body).first['location']).to eq 'springbok'
  end

  it "group items by a location" do
    get '/api/items-per-location', {}, json_header

    expect(last_response.status).to eq 200
    expect(JSON.parse(last_response.body)).to eq [ {"location"=>"supplier", "quantity"=>10},
                                                   {"location"=>"brackenfell", "quantity"=>1},
                                                   {"location"=>"springbok", "quantity"=>1}]
  end

  it "lists all items for provided sap number" do
    get '/api/items', {sap_number: '0164584'}, json_header
    expect(last_response.status).to eq 200
    response = JSON.parse(last_response.body)
    expect(response[0]['sap_number']).to eq '0164584'
    expect(response[1]['sap_number']).to eq '0164584'
    expect(response.count).to eq 6
  end

  it "lists all items for provided purchase order number" do
    get '/api/items', {purchase_order_number: '3070278100'}, json_header
    expect(last_response.status).to eq 200
    response = JSON.parse(last_response.body)
    expect(response[0]['purchase_order_number']).to eq '3070278100'
    expect(response[1]['purchase_order_number']).to eq '3070278100'
    expect(response.count).to eq 5
  end

  it "returns the details of each item in the provided list" do
    rfids = [ '2015052900000000000000000000ABD3', '2015052900000000000000000000ABD5',
              '2015052900000000000000000000ABCF' ]
    get '/api/items/detail', ({ rfids: rfids })

    expect( last_response.status ).to eq 200
    expect( JSON.parse(last_response.body).count ).to eq 3
    expect( JSON.parse(last_response.body).map{|item| item['rfid']} ).to match_array( rfids )
  end

  describe "arrival of items at location" do
    it "accepts items for arrival at a specific location" do
      rfids = ['2015052900000000000000000000ABD3','2015052900000000000000000000ABD5', '2015052900000000000000000000ABCF']
      post '/api/items/arrive', ({location: 'brackenfell', rfids: rfids}).to_json, plain_header
      expect( last_response.status ).to eq 200
      expect( Item.where({rfid: '2015052900000000000000000000ABD3'}).first.location).to eq 'brackenfell'
      expect( Item.where({rfid: '2015052900000000000000000000ABD5'}).first.location).to eq 'brackenfell'
      expect( Item.where({rfid: '2015052900000000000000000000ABCF'}).first.location).to eq 'brackenfell'
    end
  end

  describe "issue of items" do
    it "issues items to a location / project / storage location" do
      rfids = ['2015052900000000000000000000ABD3','2015052900000000000000000000ABD5', '2015052900000000000000000000ABCF']
      post '/api/items/issue', ({ device_id: 'c4:6a:b7:f2:6e:a3', rfids: rfids, project_name: 'my_project',
                                  location: 'brackenfell', sloc: 'my_bin' }).to_json, plain_header
      expect( last_response.status ).to eq 200
      expect( JSON.parse(last_response.body) ).to eq({'message'=>'success'})
      expect(Item.where(rfid: '2015052900000000000000000000ABD3').first.location).to eq 'brackenfell'
      expect(Item.where(rfid: '2015052900000000000000000000ABD3').first.location).to eq 'brackenfell'
      expect(Item.where(rfid: '2015052900000000000000000000ABD3').first.project_name).to eq 'my_project'
      expect(Item.where(rfid: '2015052900000000000000000000ABD3').first.project_name).to eq 'my_project'
      expect(Item.where(rfid: '2015052900000000000000000000ABD3').first.storage_location).to eq 'my_bin'
      expect(Item.where(rfid: '2015052900000000000000000000ABD3').first.storage_location).to eq 'my_bin'
    end
  end

   describe "arrival of items at location" do
     pending
     before :each do
       @reader_name = 'brackenfell-gate1'
       post_body = "reader_name=%22brackenfell%2dgate1%22&mac_address=%2200%3a16%3a25%3a10%3aE3%3a04%22&line_ending=%0a&field_delim=%2c&field_names=epc&field_values=%2220150529000000008FF92F2500000000%22%0a%222015052900000000000000000000ABE2%22%0a%22340966364CB0000003A00C1B%22%0a%222015052900000000000000000000ABD0%22%0a%222015052900000000000000000000ABD4%22%0a%222015052900000000000000000000ABD1%22%0a%222015052900000000000000000000ABD3%22%0a%222015052900000000000000000000ABD5%22%0a%222015052900000000000000000000ABCF%22%0a%2220150529000000008FF92F2500000000%22%0a%222015052900000000000000000000ABD6%22%0a%22340966364CB0000003A00C1B%22%0a%222015052900000000000000000000ABE2%22%0a%222015052900000000000000000000ABD1%22%0a%222015052900000000000000000000ABD2%22%0a%222015052900000000000000000000ABE2%22%0a%222015052900000000000000000000ABCF%22%0a%222015052900000000000000000000ABD0%22%0a%222015052900000000000000000000ABD5%22%0a%222015052900000000000000000000ABD6%22%0a%22340966364CB0000003A00C1B%22%0a%222015052900000000000000000000ABD4%22%0a%222015052900000000000000000000ABD3%22%0a%2220150529000000008FF92F2500000000%22%0a%22340966364CB0000003A00C1B%22%0a%222015052900000000000000000000ABD1%22%0a%222015052900000000000000000000ABE2%22%0a%222015052900000000000000000000ABCF%22%0a%222015052900000000000000000000ABD6%22%0a%222015052900000000000000000000ABD0%22%0a%222015052900000000000000000000ABD2%22%0a%222015052900000000000000000000ABD5%22%0a%222015052900000000000000000000ABD3%22%0a%222015052900000000000000000000ABD4%22%0a%2220150529000000008FF92F2500000000%22%0a%2220150529000000008FF92F2500000000%22%0a%222015052900000000000000000000ABD5%22%0a%222015052900000000000000000000ABD2%22%0a%222015052900000000000000000000ABD6%22%0a%222015052900000000000000000000ABD4%22%0a%222015052900000000000000000000ABCF%22%0a%222015052900000000000000000000ABD1%22%0a%22340966364CB0000003A00C1B%22%0a%222015052900000000000000000000ABE2%22%0a%222015052900000000000000000000ABD0%22%0a%222015052900000000000000000000ABD3%22%0a%222015052900000000000000000000ABD0%22%0a%2220150529000000008FF92F2500000000%22%0a%22340966364CB0000003A00C1B%22%0a%222015052900000000000000000000ABCF%22%0a%222015052900000000000000000000ABD6%22%0a%222015052900000000000000000000ABD4%22%0a%222015052900000000000000000000ABD5%22%0a%222015052900000000000000000000ABD2%22%0a%222015052900000000000000000000ABD1%22%0a"
       post '/api/items/scanned', (post_body), plain_header
    end

    it "updates the item's location to that of the reader's name" do
      pending
      expect( last_response.status ).to eq 200
      response_body = JSON.parse( last_response.body )
      expect( response_body['message'] ).to eq 'success'
      expect( Item.all.first.location ).to eq @reader_name
    end
    it "updates the item's status to unaccepted" do
      pending
      expect( Item.all.first.status ).to eq 'unaccepted'
    end
    it "updates the stock on hand in that location for that item type" do
      pending
      stock_on_hand = Item.all.select{|x| x.status == 'unaccepted' && x.location == @reader_name}.count
      expect( stock_on_hand ).to eq 3
    end
  end

  it "imports given items" do
    items =
      [ { rfid: '2015052900000000000000000000ABCD', sap_number: '164568', location: 'supplier', purchase_order_number: 'PO_14668',
          supplier: 'Brits Pale', expire_date: '12/12/2030',  manufacture_date: '04/02/2016' },
        { rfid: '2015052900000000000000000000ABCE', sap_number: '164568', location: 'supplier', purchase_order_number: 'PO_14668',
          supplier: 'Brits Pale', expire_date: '12/12/2030',  manufacture_date: '04/02/2016' },
        { rfid: '2015052900000000000000000000ABCF', sap_number: '164568', location: 'supplier', purchase_order_number: 'PO_14668',
          supplier: 'Brits Pale', expire_date: '12/12/2030',  manufacture_date: '04/02/2016' },
        { rfid: '2015052900000000000000000000ABD0', sap_number: '164568', location: 'supplier', purchase_order_number: 'PO_14668',
          supplier: 'Brits Pale', expire_date: '12/12/2030',  manufacture_date: '04/02/2016' } ]
    post '/api/item/import', {overwrite: true, items: items}.to_json, json_header
    expect(last_response.status).to eq 200
    body = JSON.parse(last_response.body, symbolize_names: true)
    expect(body.count).to eq 4
    expect(body).to eq items
  end
end
