#!/usr/bin/env ruby
require_relative '../app.rb'

# USAGE
# RACK_ENV='development' ./scripts/populate_items.rb

#unless ['development', 'test'].include? ENV['RACK_ENV']
#  puts "Can only run in development or test environment"
#  exit
#end

Item.delete_all
Item.create!( rfid: '2015052900000000000000000000ABE2', sap_number: '0164584', location: 'supplier', purchase_order_number: 'po_1234', project_name: '' )
Item.create!( rfid: '2015052900000000000000000000ABD1', sap_number: '0164584', location: 'supplier', purchase_order_number: 'po_1234', project_name: '' )
Item.create!( rfid: '20150529000000008FF92F2500000000', sap_number: '0164584', location: 'supplier', purchase_order_number: 'po_1234', project_name: '' )
Item.create!( rfid: '2015052900000000000000000000ABCF', sap_number: '0164584', location: 'supplier', purchase_order_number: 'po_1234', project_name: '' )
Item.create!( rfid: '2015052900000000000000000000ABD0', sap_number: '0164584', location: 'supplier', purchase_order_number: 'po_1234', project_name: '' )
Item.create!( rfid: '2015052900000000000000000000ABD4', sap_number: '0164584', location: 'supplier', purchase_order_number: 'po_1234', project_name: '' )
Item.create!( rfid: '2015052900000000000000000000ABD2', sap_number: '0164585', location: 'supplier', purchase_order_number: 'po_5678', project_name: '' )
Item.create!( rfid: '2015052900000000000000000000ABD5', sap_number: '0164585', location: 'supplier', purchase_order_number: 'po_5678', project_name: '' )
Item.create!( rfid: '2015052900000000000000000000ABD3', sap_number: '0164585', location: 'supplier', purchase_order_number: 'po_5678', project_name: '' )
Item.create!( rfid: '2015052900000000000000000000ABD6', sap_number: '0164585', location: 'supplier', purchase_order_number: 'po_5678', project_name: '' )
