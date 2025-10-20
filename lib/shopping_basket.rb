class ShoppingBasket
    attr_reader :items

    def initialize(items)
        @items = items
    end

    def total_taxes
        @items.sum {|item| item.tax * item.quantity}
    end

    def total
        @items.sum {|item| item.total_price}
    end
end