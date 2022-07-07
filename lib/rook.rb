class Rook
  attr_accessor :location
  attr_reader :color
  def initialize(location, color)
    @location = location,
    @color = color
  end

  def possible_moves(start, result = [])
    moves = [
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

# rook = Rook.new([0, 0], 'b')
# p rook.possible_moves([4, 3])