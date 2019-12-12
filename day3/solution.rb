input_path = File.expand_path "../input.txt", __FILE__
input = File.readlines input_path

wire_1_path, wire_2_path = input.map { |str| str.split(",") }

def points_on_wire path
  points = [[0, 0]]

  path.each do |move|
    direction, distance = move[0], move[1..-1].to_i

    distance.times do
      prev_point = points[-1]
      points << move_point(prev_point, direction)
    end
  end

  points
end

def move_point point, direction
  new_point = point.dup

  case direction
  when "U" then new_point[1] += 1
  when "D" then new_point[1] -= 1
  when "L" then new_point[0] -= 1
  when "R" then new_point[0] += 1
  end

  new_point
end

def manhattan_distance p1, p2
  # thanks Wikipedia!
  (p1[0] - p2[0]).abs + (p1[1] - p2[1]).abs
end

wire_1_points = points_on_wire(wire_1_path)
wire_2_points = points_on_wire(wire_2_path)
intersecting_points = wire_1_points & wire_2_points
origin = intersecting_points.shift

puts intersecting_points.map { |p| manhattan_distance origin, p }.min

# --- Part Two ---

min_distance = intersecting_points.map do |intersection|
  wire_1_points.index(intersection) + wire_2_points.index(intersection)
end.min

puts min_distance
