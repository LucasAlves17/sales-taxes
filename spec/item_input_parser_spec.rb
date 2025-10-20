require_relative '../lib/item_input_parser'
require_relative '../lib/item_tax'

RSpec.describe ItemInputParser do
    let(:tax_calculator) { ItemTax.new }
    let(:parser) { ItemInputParser.new(tax_calculator: tax_calculator) }
    

    it 'parses input lines into items' do
        input = "2 book at 12.49\n1 music CD at 14.99\n"
        items = parser.parse(input)
        expect(items.length).to eq(2)
        expect(items.first.quantity).to eq(2)
        expect(items.first.name).to eq('book')
        expect(items.first.price).to eq(12.49)

        expect(items.last.quantity).to eq(1)
        expect(items.last.name).to eq('music CD')
        expect(items.last.price).to eq(14.99)
    end

    it 'ignores invalid lines' do
        input = "invalid line\n1 chocolate bar at 0.85\n"
        items = parser.parse(input)
        expect(items.length).to eq(1)
        expect(items.first.name).to eq('chocolate bar')
    end
end
