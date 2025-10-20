class ItemTax
    BASIC_SALES_TAX = 0.10
    IMPORT_DUTY_TAX = 0.05

    def calculate(item)
        tax = 0
        tax += item.price * BASIC_SALES_TAX unless item.exempt?
        tax += item.price * IMPORT_DUTY_TAX if item.imported?

        round_tax(tax)
    end

    private

    def round_tax(tax)
        (tax / 0.05).ceil * 0.05
    end
end