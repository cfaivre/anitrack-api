#!/usr/bin/env ruby
require_relative '../app.rb'

# USAGE
# RACK_ENV='development' ./scripts/populate_items.rb

#unless ['development', 'test'].include? ENV['RACK_ENV']
#  puts "Can only run in development or test environment"
#  exit
#end

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
