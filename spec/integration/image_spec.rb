require_relative '../spec_helper'

describe "images" do

  before :each do
#    Helpers::Cleanup.all
#    Helpers::Setup.all
  end

  it "decodes a data matrix bar code" do
    pending "Image decode is put on hold for now"
    post '/api/image/data-matrix/decode', {}, image_header
    require 'rmagick'
    require 'Rdmtx'

    filename = params[:file][:filename]
    tempfile = params[:file][:tempfile]
    target = "tag-files/#{filename}"
    #overwrite = true if params['overwrite'] == 'on'
    File.open(target, 'wb') {|f| f.write tempfile.read }

    rdmtx = Rdmtx.new
    #ii = rdmtx.encode("Hello you !!", 5, 5)
    #ii.write("output.png")
    #image = Magick::Image.read('./spec/files/code.png').first
    image = Magick::Image.read(target).first
    #p DateTime.now
    x = rdmtx.decode(image, 0)
    #p DateTime.now
    p x
#
#    expect(last_response.status).to eq 200
#    expect(JSON.parse(last_response.body).count).to eq 1
  end

end
