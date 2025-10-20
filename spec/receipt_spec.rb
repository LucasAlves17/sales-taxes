require_relative '../lib/item_tax'
require_relative '../lib/receipt'

RSpec.describe Receipt do
    let(:tax_calculator) { ItemTax.new }
  
    it 'prints receipt with correct totals' do
      items = [
        Item.new(quantity: 2, name: 'book', price: 12.49, tax_calculator: tax_calculator),
        Item.new(quantity: 1, name: 'music CD', price: 14.99, tax_calculator: tax_calculator),
        Item.new(quantity: 1, name: 'chocolate bar', price: 0.85, tax_calculator: tax_calculator)
      ]
      shopping_basket = ShoppingBasket.new(items)
      printer = Receipt.new(shopping_basket)
  
      output = printer.print
      expect(output).to include('2 book: 24.98')
      expect(output).to include('1 music CD: 16.49')
      expect(output).to include('1 chocolate bar: 0.85')
      expect(output).to include('Sales Taxes: 1.50')
      expect(output).to include('Total: 42.32')
    end
end