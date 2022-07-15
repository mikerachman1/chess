class Pawn
    attr_accessor :location, :first_move, :attack_possible_left, :attack_possible_right
    attr_reader :color
    def initialize(location, color)
      @location = location
      @color = color
      @first_move = true
      @attack_possible_left = false
      @attack_possible_right = false
    end
  
    def possible_moves (start, result = []) #update to use left and right attack possible
      if first_move == true && attack_possible_right == true && attack_possible_left == true && color == 'b'
        moves = [[1, 0], [2, 0], [1, 1], [1, -1]]
      elsif first_move == true && attack_possible_right == true && attack_possible_left == true && color == 'w'
        moves = [[-1, 0], [-2, 0], [-1, -1], [-1, 1]]
      
      elsif first_move == true && attack_possible_right == false && attack_possible_left == false && color == 'b'
        moves = [[1, 0], [2, 0]]
      elsif first_move == true && attack_possible_right == false && attack_possible_left == false && color == 'w'
        moves = [[-1, 0], [-2, 0]]
      
      elsif first_move == false && attack_possible_right == true && attack_possible_left == true && color == 'b'
        moves = [[1, 0], [1, 1], [1, -1]]
      elsif first_move == false && attack_possible_right == true && attack_possible_left == true && color == 'w'
        moves = [[-1, 0], [-1, -1], [-1, 1]]
      
      elsif first_move == false && attack_possible_right == false && attack_possible_left == false && color == 'b'
        moves = [[1, 0]]
      elsif first_move == false && attack_possible_right == false && attack_possible_left == false && color == 'w'
        moves = [[-1, 0]]
      
      elsif first_move == true && attack_possible_right == false && attack_possible_left == true && color == 'b'
        moves = [[1, 0], [2, 0], [1, -1]]
      elsif first_move == true && attack_possible_right == false && attack_possible_left == true && color == 'w'
        moves = [[-1, 0], [-2, 0], [-1, -1]]
      
      elsif first_move == true && attack_possible_right == true && attack_possible_left == false && color == 'b'
        moves = [[1, 0], [2, 0], [1, 1]]
      elsif first_move == true && attack_possible_right == true && attack_possible_left == false && color == 'w'
        moves = [[-1, 0], [-2, 0], [-1, 1]]
      
      elsif first_move == false && attack_possible_right == false && attack_possible_left == true && color == 'b'
        moves = [[1, 0], [1, -1]]
      elsif first_move == false && attack_possible_right == false && attack_possible_left == true && color == 'w'
        moves = [[-1, 0], [-1, -1]]
      
      elsif first_move == false && attack_possible_right == true && attack_possible_left == false && color == 'b'
        moves = [[1, 0], [1, 1]]
      elsif first_move == false && attack_possible_right == true && attack_possible_left == false && color == 'w'
        moves = [[-1, 0], [-1, 1]]
      end
      
      moves.each do |move|
        destination = [(move[0] + start[0]), (move[1] + start[1])]
        result << destination if destination[0].between?(0, 7) && destination[1].between?(0, 7)
      end
      result
    end
  
    def path(start, destination, path = [])
      possibilities = possible_moves(start)
      return 'ERROR move impossible' unless possibilities.include?(destination)
  
      if first_move == true && color == 'w'
        moves = [[-1, 0], [-2, 0]]
        moves.each do |move|
          position = [(start[0] + move[0]), (start[1] + move[1])]
          break if position == destination
          path.push(position)
        end
      elsif first_move == true && color == 'b'
        moves = [[1, 0], [2, 0]]
        moves.each do |move|
          position = [(start[0] + move[0]), (start[1] + move[1])]
          break if position == destination
          path.push(position)
        end
      end
  
      path.unshift(start)
      path.push(destination)
    end
  end
  
  # pawn = Pawn.new([1, 0], 'w')
  # pawn.attack_possible_left = true
  # p pawn.path([6, 0], [])