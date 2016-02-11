require 'cgi'
require 'json'

class StockApiApp < Sinatra::Base

  get '/db/repopulate' do
    Cnc.delete_all
    Cnc.create!( name: 'ceres', code: '0006', color: '#008000', highlight: '#99EB99' ) #green
    Cnc.create!( name: 'swellendam', code: '0007', color: '#0000FF', highlight: '#8099CC' ) #blue
    Cnc.create!( name: 'montagu', code: '0008', color: '#FF0000', highlight: '#FF9999' ) #red
    Cnc.create!( name: 'bredasdorp', code: '0010', color: '#FFFF00', highlight: '#FFFFB2' ) #yellow
    Cnc.create!( name: 'caledon', code: '0011', color: '#FF6600', highlight: '#FFC299' ) #orange
    Cnc.create!( name: 'worcester', code: '0012', color: '#663300', highlight: '#855C33' ) #brown
    Cnc.create!( name: 'polkadraai', code: '0013', color: '#800080', highlight: '#D699FF' ) #purple
    Cnc.create!( name: 'somerset west', code: '0014', color: '#808080', highlight: '#C0C0C0' ) #gray
    Cnc.create!( name: 'kraaifontein', code: '0015', color: '#FF00FF', highlight: '#FF99FF' ) #pink
    Cnc.create!( name: 'grabouw', code: '0016', color: '#808000', highlight: '#C0C080' ) #olive
    Cnc.create!( name: 'malmesbury', code: '0017', color: '#C0C0C0', highlight: '#D9D9D9' ) #silver
    Cnc.create!( name: 'piketberg', code: '0018', color: '#800000', highlight: '#CC9999' ) #maroon
    Cnc.create!( name: 'vredendal', code: '0020', color: '#00FFFF', highlight: '#CCFFFF'  ) #aqua
    Cnc.create!( name: 'dedoorns', code: '0118', color: '#00FF00', highlight: '#B2FFB2'  ) #green2
    Cnc.create!( name: 'springbok', code: '0119', color: '#008080', highlight: '#B2D9D9' ) #teal
    Cnc.create!( name: 'airport', code: '0209', color: '#000080', highlight: '#9999CC' ) #navy
    Cnc.create!( name: 'laingsburg', code: '0324', color: '#336699', highlight: '#99B2CC' ) #blue2
    Cnc.create!( name: 'carbon', code: '0327', color: '#009933', highlight: '#CCEBD6' ) #green3
    Cnc.create!( name: 'khayelitsha', code: '0328', color: '#FF3300', highlight: '#FF9980' ) #red2
    Cnc.create!( name: 'spine', code: '0329', color: '#9900CC', highlight: '#D699EB' ) #purple2
    Cnc.create!( name: 'beaufort wes', code: '0003', color: '#99FF33', highlight: '#CCFF99' ) #yellow2
    Cnc.create!( name: 'george', code: '0004', color: '#996633', highlight: '#D6C2AD' ) #brown2
    Cnc.create!( name: 'riversdal', code: '0005', color: '#669999', highlight: '#A3C2C2' ) #blue/gray
    Cnc.create!( name: 'ladysmith', code: '0009', color: '#FFFFFF', highlight: '#E6E6E6' ) #white
    Cnc.create!( name: 'plettenbergbaai', code: '0323', color: '#CC00CC', highlight: '#E680E6' ) #pink2
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
Item.delete_all
Item.create!(rfid: '2015052900000000000000000000ABCD', sap_number: '164568', location: 'supplier', purchase_order_number: 'PO_14668', supplier: 'Brits Pale', expire_date: '12/12/2030',  manufacture_date: '04/02/2016')
Item.create!(rfid: '2015052900000000000000000000ABCE', sap_number: '164568', location: 'supplier', purchase_order_number: 'PO_14668', supplier: 'Brits Pale', expire_date: '12/12/2030',  manufacture_date: '04/02/2016')
Item.create!(rfid: '2015052900000000000000000000ABCF', sap_number: '164568', location: 'supplier', purchase_order_number: 'PO_14668', supplier: 'Brits Pale', expire_date: '12/12/2030',  manufacture_date: '04/02/2016')
Item.create!(rfid: '2015052900000000000000000000ABD0', sap_number: '164568', location: 'supplier', purchase_order_number: 'PO_14668', supplier: 'Brits Pale', expire_date: '12/12/2030',  manufacture_date: '04/02/2016')
Item.create!(rfid: '2015052900000000000000000000ABD1', sap_number: '164570', location: 'supplier', purchase_order_number: 'PO_74672', supplier: 'Khulani Timber', expire_date: '12/12/2030',  manufacture_date: '16/11/2015')
Item.create!(rfid: '2015052900000000000000000000ABD2', sap_number: '164570', location: 'supplier', purchase_order_number: 'PO_74672', supplier: 'Khulani Timber', expire_date: '12/12/2030',  manufacture_date: '16/11/2015')
Item.create!(rfid: '2015052900000000000000000000ABD3', sap_number: '559837', location: 'supplier', purchase_order_number: 'PO_74672', supplier: 'Khulani Timber', expire_date: '12/12/2030',  manufacture_date: '16/11/2015')
Item.create!(rfid: '2015052900000000000000000000ABD4', sap_number: '559837', location: 'supplier', purchase_order_number: 'PO_14675', supplier: 'Brits Pale', expire_date: '12/12/2030',  manufacture_date: '09/01/2016')
Item.create!(rfid: '2015052900000000000000000000ABD5', sap_number: '164591', location: 'supplier', purchase_order_number: 'PO_14675', supplier: 'Brits Pale', expire_date: '12/12/2030',  manufacture_date: '09/01/2016')
Item.create!(rfid: '2015052900000000000000000000ABD6', sap_number: '164591', location: 'supplier', purchase_order_number: 'PO_27677', supplier: 'Khulani Timber', expire_date: '12/12/2030',  manufacture_date: '23/09/2015')
Item.create!(rfid: '2015052900000000000000000000ABD7', sap_number: '164591', location: 'supplier', purchase_order_number: 'PO_27677', supplier: 'Khulani Timber', expire_date: '12/12/2030',  manufacture_date: '23/09/2015')
Item.create!(rfid: '2015052900000000000000000000ABE2', sap_number: '164547', location: 'supplier', purchase_order_number: 'PO_27677', supplier: 'Khulani Timber', expire_date: '12/12/2030',  manufacture_date: '23/09/2015')
Item.create!(rfid: '20150529000000008FF92F2500000000', sap_number: '164562', location: 'supplier', purchase_order_number: 'PO_27677', supplier: 'Khulani Timber', expire_date: '12/12/2030',  manufacture_date: '23/09/2015')
Item.create!(rfid: 'E20020838205022422102D2D', sap_number: '100001', location: 'supplier', purchase_order_number: 'PO_10045', supplier: 'ZEST Energy', expire_date: '12/12/2023',  manufacture_date: '11/12/2015')
Item.create!(rfid: 'E200208382050198220032EC', sap_number: '100001', location: 'supplier', purchase_order_number: 'PO_10045', supplier: 'ZEST Energy', expire_date: '12/12/2023',  manufacture_date: '11/12/2015')
Item.create!(rfid: 'E20020838205017422102DF5', sap_number: '100001', location: 'supplier', purchase_order_number: 'PO_10045', supplier: 'ZEST Energy', expire_date: '12/12/2023',  manufacture_date: '11/12/2015')
Item.create!(rfid: 'E20020838205023222302D0F', sap_number: '100002', location: 'supplier', purchase_order_number: 'PO_10622', supplier: 'Powertech Transformers', expire_date: '12/12/2023',  manufacture_date: '29/10/2015')
Item.create!(rfid: 'E2002083820501782190329B', sap_number: '100002', location: 'supplier', purchase_order_number: 'PO_10622', supplier: 'Powertech Transformers', expire_date: '12/12/2023',  manufacture_date: '29/10/2015')
Item.create!(rfid: 'E20020838205013626800A98', sap_number: '100003', location: 'supplier', purchase_order_number: 'PO_20992', supplier: 'ZEST Energy', expire_date: '12/12/2023',  manufacture_date: '07/07/2015')
Item.create!(rfid: 'E2002067560E01940180F292', sap_number: '100003', location: 'supplier', purchase_order_number: 'PO_20992', supplier: 'ZEST Energy', expire_date: '12/12/2023',  manufacture_date: '07/07/2015')
Item.create!(rfid: 'E2002067560F01180150F3DB', sap_number: '100003', location: 'supplier', purchase_order_number: 'PO_20992', supplier: 'ZEST Energy', expire_date: '12/12/2023',  manufacture_date:  07/07/2015)
Item.create!(rfid: 'E2002067560F01050310EC73', sap_number: '100004', location: 'supplier', purchase_order_number: 'PO_32237', supplier: 'Powertech Transformers', expire_date: '12/12/2023',  manufacture_date: '30/04/2015')
Item.create!(rfid: 'E200208382050131274005E6', sap_number: '100004', location: 'supplier', purchase_order_number: 'PO_32237', supplier: 'Powertech Transformers', expire_date: '12/12/2023',  manufacture_date: '30/04/2015')
Item.create!(rfid: '201501078860010001A70306', sap_number: '200001', location: 'supplier', purchase_order_number: 'PO_44555', supplier: 'Conlog', expire_date: '12/12/2020',  manufacture_date: '14/01/2016')
Item.create!(rfid: '201501078860010001A702DA', sap_number: '200001', location: 'supplier', purchase_order_number: 'PO_44555', supplier: 'Conlog', expire_date: '12/12/2020',  manufacture_date: '14/01/2016')
Item.create!(rfid: '201501078860010001A70330', sap_number: '200002', location: 'supplier', purchase_order_number: 'PO_33444', supplier: 'Itron', expire_date: '12/12/2020',  manufacture_date: '05/12/2015')
Item.create!(rfid: '201501078860010001A7030A', sap_number: '200002', location: 'supplier', purchase_order_number: 'PO_33444', supplier: 'Itron', expire_date: '12/12/2020',  manufacture_date: '05/12/2015')
Item.create!(rfid: '201501078860010001A702E8', sap_number: '200002', location: 'supplier', purchase_order_number: 'PO_33444', supplier: 'Itron', expire_date: '12/12/2020',  manufacture_date: '05/12/2015')
Item.create!(rfid: '201501078860010001A70309', sap_number: '200003', location: 'supplier', purchase_order_number: 'PO_77321', supplier: 'Landis+Gyr', expire_date: '12/12/2020',  manufacture_date: '29/06/2015')
Item.create!(rfid: '201501078860010001A70307', sap_number: '200003', location: 'supplier', purchase_order_number: 'PO_77321', supplier: 'Landis+Gyr', expire_date: '12/12/2020',  manufacture_date: '29/06/2015')
Item.create!(rfid: '201501078860010001A70332', sap_number: '200004', location: 'supplier', purchase_order_number: 'PO_12321', supplier: 'Conlog', expire_date: '12/12/2020',  manufacture_date: '18/08/2015')
Item.create!(rfid: '201501078860010001A70317', sap_number: '200004', location: 'supplier', purchase_order_number: 'PO_12321', supplier: 'Conlog', expire_date: '12/12/2020',  manufacture_date: '18/08/2015')
Item.create!(rfid: '201501078860010001A70308', sap_number: '200004', location: 'supplier', purchase_order_number: 'PO_12321', supplier: 'Conlog', expire_date: '12/12/2020',  manufacture_date: '18/08/2015')

Location.delete_all
Location.create!( name: 'in-transit', code: '', color: '#0066CC', highlight: '#99C2EB' ) #blue
Location.create!( name: 'supplier', code: '', color: '#336600', highlight: '#C2D1B2' ) #green

Warehouse.delete_all
Warehouse.create!( name: 'brackenfell', code: '9999', color: '#000000', highlight: '#191919' ) #black

StockTake.delete_all
    halt 200, {message: 'success'}.to_json
  end
end
