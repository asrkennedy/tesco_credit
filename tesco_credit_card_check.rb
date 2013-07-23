def run_check(numbers)
  numbers = numbers.reverse.split('')
  new_array = []
  numbers.each_index do |digit|
      if digit.odd?
        new_array.push (numbers[digit].to_i)*2
      else
        new_array.push numbers[digit]
      end
    end
  new_array = new_array.join.split('')
  total = new_array.map { |x| x.to_i}.reduce(:+)
  if total % 10 == 0
    print "(valid)\n"
  else
    print "(invalid)\n"
  end
end

credit_file = File.open('tesco_credit_card_check.txt', 'r').each_with_index do |numbers, index|
  numbers = numbers.delete(' ').chomp
  case numbers.length
  when 15
      if numbers[0].to_i == 3 && numbers[1].to_i == 4 || numbers[1].to_i == 7
        print "AMEX #{numbers} "
        run_check(numbers)
      end
  when 16
      if numbers.match(/^6011/)
        print "Discover #{numbers} "
        run_check(numbers)
      elsif numbers.match(/^(51|52|53|54|55)/)
            print "Mastercard #{numbers} "
            run_check(numbers)
      elsif numbers[0].to_i == 4
            print "Visa #{numbers} "
            run_check(numbers)
      else
        print "Undefined #{numbers} "
        run_check(numbers)
      end
  when 13
    if numbers[0].to_i == 4
      print "Visa #{numbers} "
      run_check(numbers)
    end
  else
    print "Undefined #{numbers} "
      run_check(numbers)
  end
end






