# Sales Taxes

This project is a Ruby console application that calculates sales taxes and prints a receipt for purchased items.

<table>
  <tr>
    <td><b>Ruby version</b></td>
    <td>
      3.4.7
    </td>
  </tr>
  <tr>
    <td><b>RSpec version</b></td>
    <td>
      3.13
    </td>
  </tr>
</table>

## Features

 - Calculates basic sales tax (10%) on all non-exempt items;
 - Applies import duty tax (5%) on imported goods;
 - Rounds tax amounts **up to the nearest 0.05** (e.g., 1.01 → 1.05, 1.06 → 1.10);
 - Automatically processes all input files located in the `input/` directory;
 - Generates a formatted receipt for each input file, showing:
    - Each item and its total price (including taxes);
    - Total sales taxes;
    - Total amount.


## Project Structure
```bash
sales-taxes/
├── config/
│   └── exempt_keywords.yml
├── input/
│   ├── input_1.txt
│   ├── input_2.txt
│   └── input_3.txt
├── lib/
│   ├── item_input_parser.rb
│   ├── item_tax.rb
│   ├── item.rb
│   ├── receipt.rb
│   └── shopping_basket.rb
├── spec/
│   ├── item_input_parser_spec.rb
│   ├── item_spec.rb
│   ├── item_tax_spec.rb
│   ├── receipt_spec.rb
│   ├── shopping_basket_spec.rb
│   └── spec_helper.rb
├── main.rb
└── README.md
```

## Setup

```bash
git clone git@github.com:LucasAlves17/sales-taxes.git
cd sales-taxes
bundle install
```

## Running the Application
Run the application with:
```bash
ruby main.rb
```
The application will:

- Read all `.txt` files located in the `input/` folder;  
- Parse each file and create a list of items;  
- Calculate taxes and print a receipt to the console for each input file.

## Input Files
Each input file should contain one item per line, following the format:

```bash
<quantity> [imported] <product name> at <price>
```

Example:
```bash
1 imported bottle of perfume at 47.50
1 imported box of chocolates at 10.00
```
Any line that does not follow the correct format will be ignored.

## Exempt Items Configuration

The list of exempt item keywords is defined in the file:

```bash
config/exempt_keywords.yml
```

Example:

```bash
exempt_keywords:
  - book
  - chocolate
  - pill
```

Any item whose name contains one of these keywords will not be charged the basic sales tax (10%).
Matching is case-insensitive.
You can freely edit this file to add or remove exempt itens.

## Tests

To run all tests:

```bash
rspec
```

## Example Output
```bash
Output 1: 
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32

Output 2: 
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15

Output 3: 
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported boxes of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38
```