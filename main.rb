require_relative 'lib/item'
require_relative 'lib/item_tax'
require_relative 'lib/item_input_parser'
require_relative 'lib/shopping_basket'
require_relative 'lib/receipt'

tax_calculator = ItemTax.new
parser = ItemInputParser.new(tax_calculator)

Dir["input/*.txt"].each.with_index(1)  do |file_name, index|
    file = File.read(file_name)

    puts "Output #{index}: \n"
    items = parser.parse(file)
    shopping_basket = ShoppingBasket.new(items)
    receipt = Receipt.new(shopping_basket)

    puts receipt.print
    puts "\n"
end