#!/usr/bin/env ruby
require_relative '../app.rb'

# USAGE
# RACK_ENV='development' ./scripts/populate_stock_takes.rb

#unless ['development', 'test'].include? ENV['RACK_ENV']
#  puts "Can only run in development or test environment"
#  exit
#end

StockTake.delete_all
=begin
StockTake.create!( items: [ '2015052900000000000000000000ABE2', '2015052900000000000000000000ABD1',
                            '20150529000000008FF92F2500000000', '2015052900000000000000000000ABCF',
                            '2015052900000000000000000000ABD0', '2015052900000000000000000000ABD4',
                            '2015052900000000000000000000ABD2', '2015052900000000000000000000ABD5',
                            '2015052900000000000000000000ABD3', '2015052900000000000000000000ABD6' ],
                   stats: { '0164584': { physical_count: 4, inventory_quantity: 5, expired: true},
                            '0164585': { physical_count: 6, inventory_quantity: 6, expired: false}})
=end
