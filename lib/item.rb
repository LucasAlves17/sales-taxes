require 'yaml'

class Item
    attr_reader :quantity, :name, :price, :imported, :exempt, :tax_calculator
    EXEMPT_KEYWORDS = YAML.load_file('config/exempt_keywords.yml')['exempt_keywords']

    def initialize(quantity:, name:, price:, tax_calculator:)
        @quantity = quantity
        @name = name
        @price = price
        @imported = name.downcase.include?('imported')
        @exempt = EXEMPT_KEYWORDS.any? { |w| name.downcase =~ /\b#{w}\b/ }
        @tax_calculator = tax_calculator
    end

    def exempt?
        exempt    
    end

    def imported?
        imported
    end

    def tax
        tax_calculator.calculate(self)
    end

    def total_price
        (price + tax) * quantity
    end
end