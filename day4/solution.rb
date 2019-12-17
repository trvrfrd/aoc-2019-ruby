# Your puzzle input is 125730-579381.
password_range = (125730..579381)

def has_repeated_digits?(digits)
  digits.each_index.any? { |idx| digits[idx] == digits[idx + 1] }
end

def digits_never_decrease?(digits)
  digits.each_index.none? { |idx| digits[idx + 1] && (digits[idx + 1] < digits[idx]) }
end

passwords_meeting_criteria = password_range.select { |password|
  digits = password.digits.reverse
  has_repeated_digits?(digits) && digits_never_decrease?(digits)
}

# 2081
puts passwords_meeting_criteria.length
