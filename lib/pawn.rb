class Pawn
    attr_accessor :location
    attr_reader :color
    def initialize(location, color)
      @location = location,
      @color = color
    end
  end

p1 = Pawn.new([0, 0], 'w')
p p1.class == Pawn
p p1.color == 'w'