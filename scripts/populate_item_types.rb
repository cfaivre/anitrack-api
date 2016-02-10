#!/usr/bin/env ruby
require_relative '../app.rb'

# USAGE
# RACK_ENV='development' ./scripts/populate_item_types.rb

#unless ['development', 'test'].include? ENV['RACK_ENV']
#  puts "Can only run in development or test environment"
#  exit
#end

ItemType.delete_all
ItemType.create!( sap_number: '164584', material_type: 'wooden pole', description: 'POLE,WOOD 18.0X180-199 TOP DIA     D0048', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '164585', material_type: 'wooden pole', description: 'POLE,WOOD 18.0X200-219 TOP DIA     D0048', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '164582', material_type: 'wooden pole', description: 'POLE,WOOD 16.0X180-199 TOP DIA     D0049', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '164583', material_type: 'wooden pole', description: 'POLE,WOOD 16.0X200-219 TOP DIA     D0049', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '164527', material_type: 'wooden pole', description: 'POLE,WOOD  7.0X120-139 TOP DIA     D0050', image: './img/pole_red.jpg');
ItemType.create!( sap_number: '164528', material_type: 'wooden pole', description: 'POLE,WOOD  7.0X100-120 TOP DIA     D0050', image: './img/pole_orange.jpg');
ItemType.create!( sap_number: '164564', material_type: 'wooden pole', description: 'POLE:WOOD;140-159MM TOP DIA X LG 11M', image: './img/pole_blue.jpg');
ItemType.create!( sap_number: '164566', material_type: 'wooden pole', description: 'POLE:WOOD;160-179MM TOP DIA X LG 11M', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '164567', material_type: 'wooden pole', description: 'POLE:WOOD;180-199MM TOP DIA X LG 11M', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '164568', material_type: 'wooden pole', description: 'POLE:WOOD;200-219MM TOP DIA X LG 11M', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '255411', material_type: 'wooden pole', description: 'POLE:180-199MMTOPDIA X LG11M 6500 C/ETH', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '559836', material_type: 'wooden pole', description: 'POLE:200-219MMTOPDIA X LG11M 6500 C/ETH', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '164562', material_type: 'wooden pole', description: 'POLE,WOOD 10.0m x 160-179 H4 D0052', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '164563', material_type: 'wooden pole', description: 'POLE,WOOD 10.0m x 180-199 H4 D0052', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '164523', material_type: 'wooden pole', description: 'POLE,WOOD 10.0m x 200-219 H4 D0052', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '164570', material_type: 'wooden pole', description: 'POLE:WOOD;160-179MM TOP DIA LG 12 M', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '164572', material_type: 'wooden pole', description: 'POLE:WOOD;180-199MM TOP DIA X LG 12 M', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '164573', material_type: 'wooden pole', description: 'POLE:WOOD;200-219MM TOP DIA X LG 12 M', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '255412', material_type: 'wooden pole', description: 'POLE:180-199MMTOPDIA X LG12M 5500 C/ETH', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '559837', material_type: 'wooden pole', description: 'POLE:200-219MMTOPDIA X LG12M 5500 C/ETH', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '164578', material_type: 'wooden pole', description: 'POLE,WOOD 14.0 X 160-179 H4 D0054', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '164579', material_type: 'wooden pole', description: 'POLE,WOOD 14.0 X 180-199 H4 D0054', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '164580', material_type: 'wooden pole', description: 'POLE,WOOD 14.0 X 200-219 H4 D0054', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '164560', material_type: 'wooden pole', description: 'POLE:WOOD;140-159MM TOP DIA X LG 9 M', image: './img/pole_blue.jpg');
ItemType.create!( sap_number: '164561', material_type: 'wooden pole', description: 'POLE:WOOD;160-179MM TOP DIA X LG 9 M', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '164589', material_type: 'wooden pole', description: 'POLE:WOOD;180-199MM TOP DIA X LG 9 M', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '255414', material_type: 'wooden pole', description: 'POLE:160-179MMTOPDIA X LG9M 7350 C/ETH', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '255415', material_type: 'wooden pole', description: 'POLE:180-199MMTOPDIA X LG9M 6500 C/ETH', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '255416', material_type: 'wooden pole', description: 'POLE:180-199MMTOPDIA X LG9M 5500 C/ETH', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '164575', material_type: 'wooden pole', description: 'POLE,WOOD 13.0 x 160-179 H4 D0056', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '164577', material_type: 'wooden pole', description: 'POLE,WOOD 13.0 x 180-199 H4 D0056', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '194043', material_type: 'wooden pole', description: 'POLE,WOOD 13.0 x 200-219 H4 D0056', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '164524', material_type: 'wooden pole', description: 'POLE,WOOD 15.0 x 200-219 TOP DIA     D0057', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '164531', material_type: 'wooden pole', description: 'POLE,WOOD  5.0 X 80-100 TOP DIA     D0058', image: './img/pole_green.jpg');
ItemType.create!( sap_number: '164586', material_type: 'wooden pole', description: 'XARM,WOOD 2.0x120-139 TOP DIA      D0060', image: './img/pole_red.jpg');
ItemType.create!( sap_number: '164591', material_type: 'wooden pole', description: 'XARM,WOOD 2.0x140-159 TOP DIA      D0060', image: './img/pole_blue.jpg');
ItemType.create!( sap_number: '164545', material_type: 'wooden pole', description: 'X/ARM,POLE:120-139 MM;LG 2.5 M;WOOD', image: './img/pole_red.jpg');
ItemType.create!( sap_number: '164546', material_type: 'wooden pole', description: 'X/ARM,POLE:140-159 MM;LG 2.5 M;WOOD', image: './img/pole_blue.jpg');
ItemType.create!( sap_number: '164547', material_type: 'wooden pole', description: 'X/ARM,POLE:160-179 MM;LG 2.5 M;WOOD', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '571208', material_type: 'wooden pole', description: 'X/ARM,POLE:120-139 22MM HOLES;LG 2.5 M', image: './img/pole_red.jpg');
ItemType.create!( sap_number: '571209', material_type: 'wooden pole', description: 'X/ARM,POLE:140-159 22MM HOLES;LG 2.5 M', image: './img/pole_blue.jpg');
ItemType.create!( sap_number: '571210', material_type: 'wooden pole', description: 'X/ARM,POLE:160-179 22MM HOLES;LG 2.5 M', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '164549', material_type: 'wooden pole', description: 'XARM,WOOD 3.0x140-159 TOP DIA      D0062', image: './img/pole_blue.jpg');
ItemType.create!( sap_number: '164550', material_type: 'wooden pole', description: 'XARM,WOOD 3,0x160-179 TOP DIA      D0062', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '164551', material_type: 'wooden pole', description: 'XARM,WOOD 3.5x140-159 TOP DIA      D0063', image: './img/pole_blue.jpg');
ItemType.create!( sap_number: '164552', material_type: 'wooden pole', description: 'XARM,WOOD 3.5x160-179 TOP DIA      D0063', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '164556', material_type: 'wooden pole', description: 'XARM,WOOD 4.5x160-179 TOP DIA      D0064', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '164559', material_type: 'wooden pole', description: 'XARM,POLE/XARM WD 8.0x160-179 T/DIA D0065', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '183978', material_type: 'wooden pole', description: 'XARM,WOOD 6.0x160-179 TOP DIA      D0066', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '100001', material_type: 'transformer', description: 'TRANSFORMER, 200kVA 11kV/420V', image: '');
ItemType.create!( sap_number: '100002', material_type: 'transformer', description: 'TRANSFORMER, 300kVA 11kV/420V', image: '');
ItemType.create!( sap_number: '100003', material_type: 'transformer', description: 'TRANSFORMER, 400kVA 11kV/420V', image: '');
ItemType.create!( sap_number: '100004', material_type: 'transformer', description: 'TRANSFORMER, 500kVA 11kV/420V', image: '');
ItemType.create!( sap_number: '200001', material_type: 'meter', description: 'METER, PLASTIC HOUSING, TYPE 1, SPECS', image: '');
ItemType.create!( sap_number: '200002', material_type: 'meter', description: 'METER, PLASTIC HOUSING, TYPE 2, SPECS', image: '');
ItemType.create!( sap_number: '200003', material_type: 'meter', description: 'METER, PLASTIC HOUSING, TYPE 3, SPECS', image: '');
ItemType.create!( sap_number: '200004', material_type: 'meter', description: 'METER, PLASTIC HOUSING, TYPE 4, SPECS', image: '');
