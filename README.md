# grocery-store-challenge

- sudo gem install minitest -v 5.4.0
- sudo gem install terminal-table

follow below instructions to test the application

```
$ ruby lib/price_calculator.rb
Please enter all the items purchased separated by a comma
milk,milk, bread,banana,bread,bread,bread,milk,apple

+--------+----------+-------+
| Item   | Quantity | Price |
+--------+----------+-------+
| milk   | 3        | 8.97  |
| bread  | 4        | 8.17  |
| banana | 1        | 0.99  |
| apple  | 1        | 0.89  |
+--------+----------+-------+

Total price : $19.02
You saved $3.45 today.


To run tests with out entering the app, please comment out

<!-- OrderEntry.new(BillingMachine).enter_order --> (line 150) at end of the app in lib/price_calculator.rb file

without commenting out the above lin also tests will work and they work on the data that passed through tests - check test/price_calculator_test.rb

```
