input_path = File.expand_path("input.txt", File.dirname(__FILE__))
input = File.readlines(input_path)

def fuel_required(mass)
  (mass / 3.0).floor - 2
end

masses = input.map(&:to_i)
total_fuel_requirement = masses.map { |m| fuel_required(m) }.sum

# 3331523
puts total_fuel_requirement

# --- Part Two ---

def total_fuel_required(mass)
  total_fuel_requirement = initial_fuel_requirement = fuel_required(mass)
  added_fuel_requirement = fuel_required(initial_fuel_requirement)

  while added_fuel_requirement > 0
    total_fuel_requirement += added_fuel_requirement
    added_fuel_requirement = fuel_required(added_fuel_requirement)
  end

  total_fuel_requirement
end

# 4994396
puts masses.map { |m| total_fuel_required(m) }.sum
