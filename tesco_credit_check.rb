require 'pry'

def run_check (numbers)
  (numbers.values_at(* numbers.each_index.select {|i| i.even?}))*2
        numbers.each do |digit|
          if digit > 10
            digit.split
          end
        end
        total = numbers.sum
        if total % 10 == 0
          puts "#{numbers} (valid)"
        else
          puts "#{numbers} (invalid)"
        end
end

credit_cards = ["4111111111111111",
"4111111111111",
"4012888888881881",
"378282246310005",
"6011111111111117",
"5105105105105100",
"5105105105105106",
"9111111111111111"]

credit_cards.each do |numbers|
  case "cardtype"
  when "AMEX"
    if numbers.length != 15
      if numbers.first != 3 && numbers[1] != 4 || 7
        puts "#{numbers} (invalid)"
      else
        run_check (numbers)
      end
    end
  when "Discover"
    if numbers.size != 16
      if numbers[0..3] != 6011
        puts "#{numbers} (invalid)"
      else
        run_check (numbers)
      end
    end
  when "MasterCard"
    if numbers.size != 16
      if numbers.first != 5 && numbers[1] != (1..5)
        puts "#{numbers} (invalid)"
      else
        run_check (numbers)
      end
    end
  when "Visa"
    if numbers.size != 13 || 16
      if numbers.first != 4
        puts "#{numbers} (invalid)"
      else
        run_check (numbers)
      end
    end
  else
    puts "#{numbers} (invalid)"
  end
end





