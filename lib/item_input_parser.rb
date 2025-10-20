class ItemInputParser
    def initialize(tax_calculator)
        @tax_calculator = tax_calculator
    end

    def parse(input)
        input.each_line.map do |line|
            if line =~ /(\d+)\s(.+)\sat\s([\d.]+)/
                quantity = $1.to_i
                name = $2.strip
                price = $3.to_f

                Item.new(quantity: quantity, name: name, price: price, tax_calculator: @tax_calculator)
            end
        end.compact
    end
end