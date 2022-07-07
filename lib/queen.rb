class Queen
  attr_accessor :location
  attr_reader :color
  def initialize(location, color)
    @location = location,
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
end

# queen = Queen.new([0, 3], 'b')
# p queen.possible_moves([0, 3])