input_path = File.expand_path("input.txt", File.dirname(__FILE__))
input = File.readlines(input_path)

def base_fuel_requirement(mass)
  (mass / 3.0).floor - 2
end

masses = input.map(&:to_i)
fuel_requirement = masses.map { |m| base_fuel_requirement(m) }.sum

# 3331523
puts fuel_requirement

# --- Part Two ---

def total_fuel_requirement(mass)
  total_fuel = 0
  added_fuel = base_fuel_requirement(mass)

  while added_fuel > 0
    total_fuel += added_fuel
    added_fuel = base_fuel_requirement(added_fuel)
  end

  total_fuel
end

# 4994396
puts masses.map { |m| total_fuel_requirement(m) }.sum
