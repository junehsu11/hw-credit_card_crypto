# frozen_string_literal: true

module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    total_num = 0
    check_number = nums_a[-1]
    nums_a.reverse.slice(1, num.length - 1).map.with_index do |n, i|
      total_num = luhn_condition(total_num, n, i)
    end
    total = (total_num * 9) % 10
    total == check_number
  end

  def luhn_condition(luhn_number, each_num, each_index)
    if each_index.even?
      luhn_number + (each_num * 2 < 10 ? each_num * 2 : (each_num * 2) - 9)
    else
      luhn_number + each_num
    end
  end
end
