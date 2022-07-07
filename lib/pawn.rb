class Pawn
    attr_accessor :location
    attr_reader :color
    def initialize(location, color)
      @location = location,
      @color = color
      @first_move = true
    end

    def possible_moves (start, result = [])
    end
  end

