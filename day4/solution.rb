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

# --- Part Two ---
def repeated_digits_not_part_of_a_larger_group?(digits)
  digits.group_by { |d| d }.any? { |_, digits| digits.count == 2 }
end

passwords_meeting_all_criteria = passwords_meeting_criteria.select { |password|
  digits = password.digits.reverse
  repeated_digits_not_part_of_a_larger_group?(digits)
}

# 1411
puts passwords_meeting_all_criteria.length
