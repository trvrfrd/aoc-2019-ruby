input = File.read(File.expand_path("input.txt", File.dirname(__FILE__)))
initial_program = input.split(",").map(&:to_i)

# TODO: maybe rewrite this as a cute OOP computer?
def run_program!(program, noun, verb)
  program[1] = noun
  program[2] = verb

  program.each_slice(4) do |(opcode, read_addr_1, read_addr_2, write_addr)|
    case opcode
    when 1
      program[write_addr] = program[read_addr_1] + program[read_addr_2]
    when 2
      program[write_addr] = program[read_addr_1] * program[read_addr_2]
    when 99
      break
    else
      raise ArgumentError, "invalid opcode: #{opcode}"
    end
  end
end

gravity_assist_program = initial_program.dup

run_program!(gravity_assist_program, 12, 2)
# 3931283
puts gravity_assist_program[0]

# --- Part Two ---

def find_inputs_for_desired_output(program, desired_output)
  0.upto(99) do |noun|
    0.upto(99) do |verb|
      current_program = program.dup
      run_program!(current_program, noun, verb)

      if current_program[0] == desired_output
        # format the noun/verb as an int NNVV
        return 100 * noun + verb
      end
    end
  end

  nil
end

# 6979
puts find_inputs_for_desired_output(initial_program, 19690720)
