require_relative '../lib/item'
require_relative '../lib/item_tax'

RSpec.describe Item do
    let(:tax_calculator) { ItemTax.new }

    describe '#imported?' do
    [
        { name: 'imported bottle of perfume', expected: true },
        { name: 'bottle of perfume', expected: false },
    ].each do |example|
        it "returns #{example[:expected]} for '#{example[:name]}'" do
          item = Item.new(quantity: 1, name: example[:name], price: 10.0, tax_calculator: tax_calculator)
          expect(item.imported?).to eq(example[:expected])
        end
      end
    end
    
    describe '#exempt?' do
    [
        { name: 'imported bottle of perfume', expected: false },
        { name: 'packet of headache pills', expected: true },
    ].each do |example|
        it "returns #{example[:expected]} for '#{example[:name]}'" do
          item = Item.new(quantity: 1, name: example[:name], price: 10.0, tax_calculator: tax_calculator)
          expect(item.exempt?).to eq(example[:expected])
        end
      end
    end

    describe '#total_price' do
    [
        { quantity: 1, name: 'imported bottle of perfume', price: 27.99, expected: 32.19 },
        { quantity: 3, name: 'imported boxes of chocolates',  price: 11.25, expected: 35.55 },
    ].each do |example|
        it "returns #{example[:expected]} for '#{example[:name]}'" do
          item = Item.new(quantity: example[:quantity], name: example[:name], price: example[:price], tax_calculator: tax_calculator)
          expect(item.total_price).to eq(example[:expected])
        end
      end
    end
end