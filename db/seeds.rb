Image.create!([
  {product_id: 1, image_url: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRX-boVeNMrNzwhapeSX22cpE1gwcyqoposLC1tEyIRrVqG7YhV"},
  {product_id: 1, image_url: "http://www.palmpickers.com/ebay1//vape_/Sigelei%20150w%20100plus/Sigelei-100-watt-Plus-150-Watt-Vape-Graphic-Decal-Skin-Zig-Zag-316130-102212-1010.jpg"},
  {product_id: nil, image_url: nil}
])
Product.create!([
  {name: "Sigelei 150 watt", price: "89.0", description: "Sigelei 150 watt, excellent size, 2 18650 batteries not included, comes with magnetic door to house batteries, large power button, floating pin which fits all 510 connections, large screen shows wattage/voltage, battery level, as well as ohms. Comes with silicon sleeve for added grip and protection.", in_stock: true, supplier_id: 1, user_id: nil},
  {name: "Vapor Shark DNA 200", price: "140.0", description: "Vapor Shark DNA 200, floating pin, 18650 batteries not included. Comes in black, screen on bottom of device shows wattage, ohms, battery level.", in_stock: true, supplier_id: 2, user_id: nil},
  {name: "ip3v box mod", price: "30.0", description: "ipv3 box mod, sleek, comes in black or white, twin 18650 batteries not included, fits all 510 connections, external screen shows ohms, wattage, voltage, battery level, comes in black or white", in_stock: true, supplier_id: 1, user_id: nil},
  {name: "Jelly Fish Box Mod", price: "220.0", description: "jellyfish box mod, internal battery with usb cord, fits all 510 connection, comes in different colors, external display shows battery percentage, wattage, voltage, as well as ohms.", in_stock: true, supplier_id: 2, user_id: nil},
  {name: "tech space mug", price: "2.99", description: "this is how much a tech space mug is", in_stock: true, supplier_id: 3, user_id: nil}
])
Supplier.create!([
  {name: "Bay City Vapes", email: "support@baycityvapes.com", phone: "555-555-5544"},
  {name: "VapeCanos", email: "contact@vapecanos.com", phone: "555-555-3344"}
])
