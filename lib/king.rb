class King
  attr_accessor :location
  attr_reader :color
  def initialize(location, color)
    @location = location,
    @color = color
  end

  def possible_moves (start, result = [])
    moves = [
        [1, 0], [0, 1], [-1, 0], [0, -1],
        [1, 1], [-1, -1], [1, -1], [-1, 1]
    ]
    moves.each do |move|
      destination = [(move[0] + start[0]), (move[1] + start[1])]
      result << destination if destination[0].between?(0, 7) && destination[1].between?(0, 7)
    end
    result
  end
end

king = King.new([0, 4], 'b')
p king.possible_moves([0, 4])