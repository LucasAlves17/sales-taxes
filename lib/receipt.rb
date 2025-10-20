class Receipt
    def initialize(shopping_basket)
        @shopping_basket = shopping_basket
    end

    def print
        receipt = @shopping_basket.items.map do |item|
            "#{item.quantity} #{item.name}: %.2f" % item.total_price
        end

        receipt << "Sales Taxes: %.2f" % @shopping_basket.total_taxes
        receipt << "Total: %.2f" % @shopping_basket.total
        receipt.join("\n")
    end
end