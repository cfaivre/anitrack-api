module Helpers
  module Setup
    def self.all
      cncs
      item_types
      items
      warehouses
      locations
    end

    def self.cncs
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
    end

    def self.warehouses
      Warehouse.create!( name: 'brackenfell', code: '9999', color: '#000000', highlight: '#191919' ) #black
    end

    def self.locations
      Location.create!( name: 'in-transit', code: '', color: '#0066CC', highlight: '#99C2EB' )
      Location.create!( name: 'supplier', code: '', color: '#336600', highlight: '#C2D1B2' )
    end

    def self.items
      Item.create!( rfid: '2015052900000000000000000000ABE2', sap_number: '0164584', location: 'brackenfell' )
      Item.create!( rfid: '2015052900000000000000000000ABD1', sap_number: '0164584', location: 'brackenfell' )
      Item.create!( rfid: '20150529000000008FF92F2500000000', sap_number: '0164584', location: 'brackenfell' )
      Item.create!( rfid: '2015052900000000000000000000ABCF', sap_number: '0164584', location: 'brackenfell' )
      Item.create!( rfid: '2015052900000000000000000000ABD0', sap_number: '0164584', location: 'brackenfell' )
      Item.create!( rfid: '2015052900000000000000000000ABD4', sap_number: '0164584', location: 'brackenfell' )
      Item.create!( rfid: '2015052900000000000000000000ABD2', sap_number: '0164585', location: 'brackenfell' )
      Item.create!( rfid: '2015052900000000000000000000ABD5', sap_number: '0164585', location: 'brackenfell' )
      Item.create!( rfid: '2015052900000000000000000000ABD3', sap_number: '0164585', location: 'brackenfell' )
      Item.create!( rfid: '2015052900000000000000000000ABD6', sap_number: '0164585', location: 'brackenfell' )
    end

    def self.item_types
      ItemType.create!( sap_number: '0164584', material_type: 'wooden pole', description: 'POLE,WOOD 18.0X180-199 TOP DIA     D0048', image: './img/pole_white.jpg');
      ItemType.create!( sap_number: '0164585', material_type: 'wooden pole', description: 'POLE,WOOD 18.0X200-219 TOP DIA     D0048', image: './img/pole_purple.jpg');
    end

    def self.stock_takes
      StockTake.create!( device_id: '00:11:22:33:44:55',
                         items: [ '2015052900000000000000000000ABE2','2015052900000000000000000000ABD1','20150529000000008FF92F2500000000',
                                  '2015052900000000000000000000ABD6','2015052900000000000000000000ABD3','2015052900000000000000000000ABD5' ] )
      StockTake.create!( device_id: '00:11:22:33:44:55',
                         items: [ '2015052900000000000000000000ABCF','2015052900000000000000000000ABD0','2015052900000000000000000000ABD4',
                                  '2015052900000000000000000000ABD2' ] )
    end

  end
end
