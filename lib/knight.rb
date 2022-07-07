class Knight
  attr_accessor :location
  attr_reader :color
  def initialize(location, color)
    @location = location,
    @color = color
  end

  def possible_moves (start, result = [])
    moves = [[2, 1], [2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2], [-2, 1], [-2, -1]]
    moves.each do |move|
      destination = [(move[0] + start[0]), (move[1] + start[1])]
      result << destination if destination[0].between?(0, 7) && destination[1].between?(0, 7)
    end
    result
  end
end