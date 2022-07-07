require_relative 'knight'; require_relative 'bishop'; require_relative 'king'; require_relative 'queen'; require_relative 'pawn'; require_relative 'rook'

class Board
  attr_accessor :board
  def initialize
    @board = [
        [ [], [], [], [], [], [], [], [] ],
        [ [], [], [], [], [], [], [], [] ],
        [ [], [], [], [], [], [], [], [] ],
        [ [], [], [], [], [], [], [], [] ],
        [ [], [], [], [], [], [], [], [] ],
        [ [], [], [], [], [], [], [], [] ],
        [ [], [], [], [], [], [], [], [] ],
        [ [], [], [], [], [], [], [], [] ]
      ]
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
    bR1 = Rook.new([7, 0], 'b'); bR2 = Rook.new([7, 7], 'b')
    bKn1 = Knight.new([0, 1], 'b'); bKn2 = Knight.new([0, 6], 'b')
    bB1 = Bishop.new([0, 2], 'b'); bB2 = Bishop.new([0, 5], 'b')
    bQ = Queen.new([0, 3], 'b'); bK = King.new([0, 4], 'b')

    @board = [
        [ [bR1], [bKn1], [bB1], [bQ], [bK], [bB2], [bKn2], [bR2] ],
        [ [bP1], [bP2], [bP3], [bP4], [bP5], [bP6], [bP7], [bP8] ],
        [ [], [], [], [], [], [], [], [] ],
        [ [], [], [], [], [], [], [], [] ],
        [ [], [], [], [], [], [], [], [] ],
        [ [], [], [], [], [], [], [], [] ],
        [ [wP1], [wP2], [wP3], [wP4], [wP5], [wP6], [wP7], [wP8] ],
        [ [wR1], [wKn1], [wB1], [wQ], [wK], [wB2], [wKn2], [wR2] ]
      ]
  end


end

game = Board.new

game.start_game_pieces
p game.board
