class Queen
  attr_accessor :location
  attr_reader :color
  def initialize(location, color)
    @location = location
    @color = color
  end

  def possible_moves (start, result = [])
    moves = [
        [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
        [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7],
        [1, -1], [2, -2], [3,-3], [4, -4], [5, -5], [6, -6], [7, -7],
        [-1, 1], [-2, 2], [-3,3], [-4, 4], [-5, 5], [-6, 6], [-7, 7],
        [7, 0], [6, 0], [5, 0], [4, 0], [3, 0], [2, 0], [1, 0],
        [0, 7], [0, 6], [0, 5], [0, 4], [0, 3], [0, 2], [0, 1],
        [-7, 0], [-6, 0], [-5, 0], [-4, 0], [-3, 0], [-2, 0], [-1, 0],
        [0, -7], [0, -6], [0, -5], [0, -4], [0, -3], [0, -2], [0, -1]
    ]
    moves.each do |move|
      destination = [(move[0] + start[0]), (move[1] + start[1])]
      result << destination if destination[0].between?(0, 7) && destination[1].between?(0, 7)
    end
    result
  end

  def path(start, destination, path = [])
    possibilities = possible_moves(start)
    return 'ERROR move impossible' unless possibilities.include?(destination)

    down_right = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]]
    up_left = [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]]
    down_left = [[1, -1], [2, -2], [3,-3], [4, -4], [5, -5], [6, -6], [7, -7]]
    up_right = [[-1, 1], [-2, 2], [-3,3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
    down = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
    right = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
    up = [[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]
    left = [[0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7]]

    if start[0] < destination[0] && start[1] < destination[1] #down_right
      down_right.each do |move|
        position = [(start[0] + move[0]), (start[1] + move[1])]
        break if position == destination
        path.push(position)
      end
    elsif start[0] > destination[0] && start[1] > destination[1] #up_left
      up_left.each do |move|
        position = [(start[0] + move[0]), (start[1] + move[1])]
        break if position == destination
        path.push(position)
      end
    elsif start[0] < destination[0] && start[1] > destination[1] #down_left
      down_left.each do |move|
        position = [(start[0] + move[0]), (start[1] + move[1])]
        break if position == destination
        path.push(position)
      end
    elsif start[0] > destination[0] && start[1] < destination[1] #up_right
      up_right.each do |move|
        position = [(start[0] + move[0]), (start[1] + move[1])]
        break if position == destination
        path.push(position)
      end
    elsif start[0] < destination[0] && start[1] == destination[1] #down
      down.each do |move|
        position = [(start[0] + move[0]), (start[1] + move[1])]
        break if position == destination
        path.push(position)
      end
    elsif start[1] < destination[1] && start[0] == destination[0] #right
      right.each do |move|
        position = [(start[0] + move[0]), (start[1] + move[1])]
        break if position == destination
        path.push(position)
      end
    elsif start[0] > destination[0] && start[1] == destination[1] #up
      up.each do |move|
        position = [(start[0] + move[0]), (start[1] + move[1])]
        break if position == destination
        path.push(position)
      end
    elsif start[1] > destination[1] && start[0] == destination[0] #left
      left.each do |move|
        position = [(start[0] + move[0]), (start[1] + move[1])]
        break if position == destination
        path.push(position)
      end
    end
    path.unshift(start)
    path.push(destination)
  end
end

