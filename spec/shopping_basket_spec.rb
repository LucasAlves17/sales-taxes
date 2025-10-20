require_relative '../lib/shopping_basket'
require_relative '../lib/item'
require_relative '../lib/item_tax'

RSpec.describe ShoppingBasket do
  let(:tax_calculator) { ItemTax.new }

    it "calculates total and taxes of a shopping basket" do
        items = [
        Item.new(quantity: 2, name: "book", price: 12.49, tax_calculator: tax_calculator),
        Item.new(quantity: 1, name: "music CD", price: 14.99, tax_calculator: tax_calculator),
        Item.new(quantity: 1, name: "chocolate bar", price: 0.85, tax_calculator: tax_calculator)
        ]
        shopping_basket = ShoppingBasket.new(items)

        expect(shopping_basket.total_taxes).to eq(1.50)
        expect(shopping_basket.total).to eq(42.32)
    end
end