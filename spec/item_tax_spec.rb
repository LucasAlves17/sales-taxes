require_relative '../lib/item_tax'

RSpec.describe ItemTax do
    let(:tax_calculator) { ItemTax.new }

    describe '#calculate' do
        it 'applies basic sales tax for non-exempt items' do
            item = Item.new(quantity: 1, name: 'music CD', price: 14.99, tax_calculator: tax_calculator)
            expect(tax_calculator.calculate(item)).to eq(1.50)
        end

        it 'does not apply tax for exempt items' do
            item = Item.new(quantity: 1, name: 'book', price: 12.49, tax_calculator: tax_calculator)
            expect(tax_calculator.calculate(item)).to eq(0.0)
        end

        it 'applies import duty tax for imported items' do
            item = Item.new(quantity: 1, name: 'imported box of chocolates', price: 10.00, tax_calculator: tax_calculator)
            expect(tax_calculator.calculate(item)).to eq(0.50)
        end

        it 'applies both taxes for imported non-exempt items' do
            item = Item.new(quantity: 1, name: 'imported bottle of perfume', price: 47.50, tax_calculator: tax_calculator)
            expect(tax_calculator.calculate(item)).to eq(7.15)
        end
    end
end