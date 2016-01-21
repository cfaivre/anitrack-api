#!/usr/bin/env ruby
require_relative '../app.rb'

# USAGE
# RACK_ENV='development' ./scripts/populate_item_types.rb

#unless ['development', 'test'].include? ENV['RACK_ENV']
#  puts "Can only run in development or test environment"
#  exit
#end

ItemType.delete_all
ItemType.create!( sap_number: '0164584', material_type: 'wooden pole', description: 'POLE,WOOD 18.0X180-199 TOP DIA     D0048', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '0164585', material_type: 'wooden pole', description: 'POLE,WOOD 18.0X200-219 TOP DIA     D0048', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '0164582', material_type: 'wooden pole', description: 'POLE,WOOD 16.0X180-199 TOP DIA     D0049', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '0164583', material_type: 'wooden pole', description: 'POLE,WOOD 16.0X200-219 TOP DIA     D0049', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '0164527', material_type: 'wooden pole', description: 'POLE,WOOD  7.0X120-139 TOP DIA     D0050', image: './img/pole_red.jpg');
ItemType.create!( sap_number: '0164528', material_type: 'wooden pole', description: 'POLE,WOOD  7.0X100-120 TOP DIA     D0050', image: './img/pole_orange.jpg');
ItemType.create!( sap_number: '0164564', material_type: 'wooden pole', description: 'POLE:WOOD;140-159MM TOP DIA X LG 11M', image: './img/pole_blue.jpg');
ItemType.create!( sap_number: '0164566', material_type: 'wooden pole', description: 'POLE:WOOD;160-179MM TOP DIA X LG 11M', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '0164567', material_type: 'wooden pole', description: 'POLE:WOOD;180-199MM TOP DIA X LG 11M', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '0164568', material_type: 'wooden pole', description: 'POLE:WOOD;200-219MM TOP DIA X LG 11M', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '0255411', material_type: 'wooden pole', description: 'POLE:180-199MMTOPDIA X LG11M 6500 C/ETH', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '0559836', material_type: 'wooden pole', description: 'POLE:200-219MMTOPDIA X LG11M 6500 C/ETH', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '0164562', material_type: 'wooden pole', description: 'POLE,WOOD 10.0m x 160-179 H4 D0052', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '0164563', material_type: 'wooden pole', description: 'POLE,WOOD 10.0m x 180-199 H4 D0052', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '0164523', material_type: 'wooden pole', description: 'POLE,WOOD 10.0m x 200-219 H4 D0052', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '0164570', material_type: 'wooden pole', description: 'POLE:WOOD;160-179MM TOP DIA LG 12 M', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '0164572', material_type: 'wooden pole', description: 'POLE:WOOD;180-199MM TOP DIA X LG 12 M', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '0164573', material_type: 'wooden pole', description: 'POLE:WOOD;200-219MM TOP DIA X LG 12 M', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '0255412', material_type: 'wooden pole', description: 'POLE:180-199MMTOPDIA X LG12M 5500 C/ETH', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '0559837', material_type: 'wooden pole', description: 'POLE:200-219MMTOPDIA X LG12M 5500 C/ETH', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '0164578', material_type: 'wooden pole', description: 'POLE,WOOD 14.0 X 160-179 H4 D0054', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '0164579', material_type: 'wooden pole', description: 'POLE,WOOD 14.0 X 180-199 H4 D0054', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '0164580', material_type: 'wooden pole', description: 'POLE,WOOD 14.0 X 200-219 H4 D0054', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '0164560', material_type: 'wooden pole', description: 'POLE:WOOD;140-159MM TOP DIA X LG 9 M', image: './img/pole_blue.jpg');
ItemType.create!( sap_number: '0164561', material_type: 'wooden pole', description: 'POLE:WOOD;160-179MM TOP DIA X LG 9 M', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '0164589', material_type: 'wooden pole', description: 'POLE:WOOD;180-199MM TOP DIA X LG 9 M', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '0255414', material_type: 'wooden pole', description: 'POLE:160-179MMTOPDIA X LG9M 7350 C/ETH', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '0255415', material_type: 'wooden pole', description: 'POLE:180-199MMTOPDIA X LG9M 6500 C/ETH', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '0255416', material_type: 'wooden pole', description: 'POLE:180-199MMTOPDIA X LG9M 5500 C/ETH', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '0164575', material_type: 'wooden pole', description: 'POLE,WOOD 13.0 x 160-179 H4 D0056', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '0164577', material_type: 'wooden pole', description: 'POLE,WOOD 13.0 x 180-199 H4 D0056', image: './img/pole_white.jpg');
ItemType.create!( sap_number: '0194043', material_type: 'wooden pole', description: 'POLE,WOOD 13.0 x 200-219 H4 D0056', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '0164524', material_type: 'wooden pole', description: 'POLE,WOOD 15.0 x 200-219 TOP DIA     D0057', image: './img/pole_purple.jpg');
ItemType.create!( sap_number: '0164531', material_type: 'wooden pole', description: 'POLE,WOOD  5.0 X 80-100 TOP DIA     D0058', image: './img/pole_green.jpg');
ItemType.create!( sap_number: '0164586', material_type: 'wooden pole', description: 'XARM,WOOD 2.0x120-139 TOP DIA      D0060', image: './img/pole_red.jpg');
ItemType.create!( sap_number: '0164591', material_type: 'wooden pole', description: 'XARM,WOOD 2.0x140-159 TOP DIA      D0060', image: './img/pole_blue.jpg');
ItemType.create!( sap_number: '0164545', material_type: 'wooden pole', description: 'X/ARM,POLE:120-139 MM;LG 2.5 M;WOOD', image: './img/pole_red.jpg');
ItemType.create!( sap_number: '0164546', material_type: 'wooden pole', description: 'X/ARM,POLE:140-159 MM;LG 2.5 M;WOOD', image: './img/pole_blue.jpg');
ItemType.create!( sap_number: '0164547', material_type: 'wooden pole', description: 'X/ARM,POLE:160-179 MM;LG 2.5 M;WOOD', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '0571208', material_type: 'wooden pole', description: 'X/ARM,POLE:120-139 22MM HOLES;LG 2.5 M', image: './img/pole_red.jpg');
ItemType.create!( sap_number: '0571209', material_type: 'wooden pole', description: 'X/ARM,POLE:140-159 22MM HOLES;LG 2.5 M', image: './img/pole_blue.jpg');
ItemType.create!( sap_number: '0571210', material_type: 'wooden pole', description: 'X/ARM,POLE:160-179 22MM HOLES;LG 2.5 M', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '0164549', material_type: 'wooden pole', description: 'XARM,WOOD 3.0x140-159 TOP DIA      D0062', image: './img/pole_blue.jpg');
ItemType.create!( sap_number: '0164550', material_type: 'wooden pole', description: 'XARM,WOOD 3,0x160-179 TOP DIA      D0062', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '0164551', material_type: 'wooden pole', description: 'XARM,WOOD 3.5x140-159 TOP DIA      D0063', image: './img/pole_blue.jpg');
ItemType.create!( sap_number: '0164552', material_type: 'wooden pole', description: 'XARM,WOOD 3.5x160-179 TOP DIA      D0063', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '0164556', material_type: 'wooden pole', description: 'XARM,WOOD 4.5x160-179 TOP DIA      D0064', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '0164559', material_type: 'wooden pole', description: 'XARM,POLE/XARM WD 8.0x160-179 T/DIA D0065', image: './img/pole_yellow.jpg');
ItemType.create!( sap_number: '0183978', material_type: 'wooden pole', description: 'XARM,WOOD 6.0x160-179 TOP DIA      D0066', image: './img/pole_yellow.jpg');
#ItemType.create!( sap_number: '', material_type: 'wood', material_type: 'wooden pole', description: 'Pole 3m length',
#                  image: './img/poles.jpg', color: '', rating: '100kva')
#ItemType.create!( sap_number: '32r3454tgre4', material_type: 'pressed wood', material_type: 'wooden pole', description: 'Pole 11m length',
#                  image: './img/poles2.jpg', color: '', rating: '200kva')
