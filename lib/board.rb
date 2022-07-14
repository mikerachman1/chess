require_relative 'knight'; require_relative 'bishop'; require_relative 'king'; require_relative 'queen'; require_relative 'pawn'; require_relative 'rook'

class Board
  attr_accessor :board, :turn
  def initialize
    @board = [[],[],[],[],[],[],[],[]]
    @turn = 'White'
  end

  def start_game_pieces
    wP1 = Pawn.new([6, 0], 'w'); wP2 = Pawn.new([6, 1], 'w'); wP3 = Pawn.new([6, 2], 'w'); wP4 = Pawn.new([6, 3], 'w')
    wP5 = Pawn.new([6, 4], 'w'); wP6 = Pawn.new([6, 5], 'w'); wP7 = Pawn.new([6, 6], 'w'); wP8 = Pawn.new([6, 7], 'w')
    wR1 = Rook.new([7, 0], 'w'); wR2 = Rook.new([7, 7], 'w')
    wKn1 = Knight.new([7, 1], 'w'); wKn2 = Knight.new([7, 6], 'w')
    wB1 = Bishop.new([7, 2], 'w'); wB2 = Bishop.new([7, 5], 'w')
    wQ = Queen.new([7, 3], 'w'); wK = King.new([7, 4], 'w')

    bP1 = Pawn.new([1, 0], 'b'); bP2 = Pawn.new([1, 1], 'b'); bP3 = Pawn.new([1, 2], 'b'); bP4 = Pawn.new([1, 3], 'b')
    bP5 = Pawn.new([1, 4], 'b'); bP6 = Pawn.new([1, 5], 'b'); bP7 = Pawn.new([1, 6], 'b'); bP8 = Pawn.new([1, 7], 'b')
    bR1 = Rook.new([0, 0], 'b'); bR2 = Rook.new([0, 7], 'b')
    bKn1 = Knight.new([0, 1], 'b'); bKn2 = Knight.new([0, 6], 'b')
    bB1 = Bishop.new([0, 2], 'b'); bB2 = Bishop.new([0, 5], 'b')
    bQ = Queen.new([0, 3], 'b'); bK = King.new([0, 4], 'b')

    @board[0].push(bR1, bKn1, bB1, bQ, bK, bB2, bKn2, bR2)
    @board[1].push(bP1, bP2, bP3, bP4, bP5, bP6, bP7, bP8)
    @board[2].push(nil, nil, nil, nil, nil, nil, nil, nil)
    @board[3].push(nil, nil, nil, nil, nil, nil, nil, nil)
    @board[4].push(nil, nil, nil, nil, nil, nil, nil, nil)
    @board[5].push(nil, nil, nil, nil, nil, nil, nil, nil)
    @board[6].push(wP1, wP2, wP3, wP4, wP5, wP6, wP7, wP8)
    @board[7].push(wR1, wKn1, wB1, wQ, wK, wB2, wKn2, wR2)
  end

  def display_board
    board.each_with_index do |row, index|
      puts "\n---------------"
      row.each_with_index do |space, index|
        if space.nil? && index.even? && index.even?
          print '□'
        elsif space.nil? && index.odd? && index.even?
          print '■'
        elsif space.nil? && index.even? && index.odd?
          print '■'
        elsif space.nil? && index.odd? && index.odd?
          print '□'
        elsif space.class == Pawn && space.color == 'w'
          print '♙'
        elsif space.class == Pawn && space.color == 'b'
          print '♟'
        elsif space.class == Rook && space.color == 'w'
          print '♖'
        elsif space.class == Rook && space.color == 'b'
          print '♜'
        elsif space.class == Knight && space.color == 'w'
          print '♘'
        elsif space.class == Knight && space.color == 'b'
          print '♞'
        elsif space.class == Bishop && space.color == 'w'
          print '♗'
        elsif space.class == Bishop && space.color == 'b'
          print '♝'
        elsif space.class == Queen && space.color == 'w'
          print '♕'
        elsif space.class == Queen && space.color == 'b'
          print '♛'
        elsif space.class == King && space.color == 'w'
          print '♔'
        elsif space.class == King && space.color == 'b'
          print '♚'
        end
        print '|' if index < 7
      end
    end
  end

  def move_possible?(start, destination)
    selected_piece = board[(start[0])][(start[1])]
    return false if selected_piece.nil? #if no piece at start arg

    possibilities = selected_piece.possible_moves(start)
    return false unless possibilities.include?(destination) #if destination is not a possiblity for piece

    path = selected_piece.path(start, destination)
    path.pop 
    path.shift
    path.each do |position|
      board_position = board[(position[0])][(position[1])]
      return false if board_position.nil? == false #if piece is in path
    end
    
    board_destination = board[(destination[0])][(destination[1])]
    return true if board_destination.nil?
    board_destination.color == selected_piece.color ? false : true
  end

  def move_piece(start, destination) #only to be used after #move_possible? checks if good move
    selected_piece = board[(start[0])][(start[1])]
    board[(destination[0])][(destination[1])] = selected_piece
    board[(start[0])][(start[1])] = nil
  end

  def change_turn
    turn == 'White' ? @turn = 'Black' : @turn = 'White'
  end

  def get_user_input(step)
    loop do
      puts "\nIt is #{turn}'s turn\nEnter the row and column numbers (0-7).\nexample: 1 3"
      input = gets.chomp.split(' ').map { |x| x.to_i }
      
      if input.length == 2 && input.all? { |x| x.between?(0, 7) } 
        return input if step == 2
        piece = board[(input[0])][(input[1])]
        turn == 'White' ? color = 'w' : color = 'b'

        return input if piece.nil? == false && piece.color == color
      end
      
      sleep(1)
      puts "\nINPUT ERROR! Try again"
    end
  end

  def promotion?
    return true if board[0].any? { |space| space.class == Pawn && space.color == 'w' } #If white pawn is in black endzone
    return true if board[7].any? { |space| space.class == Pawn && space.color == 'b' } #If black pawn is in black endzone
    false
  end

  def promote(location)
    if turn == 'White'
      board[(location[0])][(location[1])] = Queen.new(location, 'w')
    else
      board[(location[0])][(location[1])] = Queen.new(location, 'b')
    end
  end

  def play_game
    puts "Lets Play Chess!\n Decide who will be which color, White goes first."
    start_game_pieces
    loop do
      display_board
      loop do 
        puts "\nFirst select your piece to move"
        start = get_user_input(1)
        puts "\nNow select the destination"
        destination = get_user_input(2)
        if move_possible?(start, destination)
          move_piece(start, destination)
          promote(destination) if promotion?
          break
        else
          puts "INVALID MOVE, Restarting your turn..."
          sleep(1)
        end
      end
      change_turn
    end
    puts 'GAME OVER'
  end

end

game = Board.new
game.play_game

