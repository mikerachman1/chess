class Pawn
    attr_accessor :location
    attr_reader :color
    def initialize(location, color)
      @location = location,
      @color = color
    end
  end