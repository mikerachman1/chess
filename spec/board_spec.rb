require_relative '../lib/board.rb'
require_relative '../lib/knight.rb'
require_relative '../lib/rook.rb'
require_relative '../lib/bishop.rb'
require_relative '../lib/queen.rb'
require_relative '../lib/king.rb'
require_relative '../lib/pawn.rb'

describe Board do

  describe '#move_possible?' do
    
    subject(:game_move_possible) { described_class.new }
    
    before do 
      game_move_possible.start_game_pieces
    end

    context 'move is possible' do
      it 'returns true' do
        start = [1, 0]
        destination = [2, 0]
        expect(game_move_possible.move_possible?(start, destination)).to be true
      end
    end

    context 'move is not possible' do
      it 'returns false' do
        start = [1, 0]
        destination = [7, 0]
        expect(game_move_possible.move_possible?(start, destination)).to be false
      end
    end
  end

  describe '#move_piece' do
    subject(:game_move_piece) { described_class.new }
    
    before do 
      game_move_piece.start_game_pieces
    end

    context 'when moving a piece' do
      it 'updates the @board' do
        start = [1, 0]
        destination = [2, 0]
        board = game_move_piece.board
        game_move_piece.move_piece(start, destination)
        expect(board[2][0]).not_to be_nil
      end
    end
  end

  describe '#change_turn' do
    subject(:game_changeturn) { described_class.new }

    context 'It is blacks turn' do
      before do
        game_changeturn.instance_variable_set(:@turn, 'Black')
      end
      it 'change turn to white' do
        game_changeturn.change_turn
        turn = game_changeturn.turn
        expect(turn).to eq('White')
      end
    end
  end

  describe '#get_user_input' do
    
    subject(:game_input) { described_class.new }
    before do
      game_input.start_game_pieces
    end

    context 'user inputs correct input' do
    
      before do
        valid_input = "6 0\n"
        allow(game_input).to receive(:gets).and_return(valid_input)
      end

      it 'does not raise error message' do
        error_message = "\nINPUT ERROR! Try again"
        expect(game_input).not_to receive(:puts).with(error_message)
        game_input.get_user_input(1)
      end
    end

    # context 'user inputs incorrect input once then correct' do
    #     before do
    #       bad_input = "99\n"
    #       valid_input = "6 0\n"
    #       allow(game_input).to receive(:gets).and_return(bad_input, valid_input)
    #     end
    
    #     it 'raises error message once' do
    #       error_message = "\nINPUT ERROR! Try again"
    #       expect(game_input).to receive(:puts).with(error_message).once
    #       game_input.get_user_input(1)
    #     end
    # end
  end

  describe '#promotion?' do
    
    subject(:game_promotion) { described_class.new }
    
    before do
      game_promotion.start_game_pieces
    end
    
    context 'pawn in endzone' do
      before do
        board = game_promotion.board
        board[0][0] = Pawn.new([0, 0], 'w')
      end
      it 'returns true' do
        expect(game_promotion.promotion?).to be true
      end
    end

    context 'pawn not in endzone' do
      it 'returns false' do
        board = game_promotion.board
        expect(game_promotion.promotion?).to be false
      end
    end
  end

  describe '#promote' do
    subject(:game_promote) { described_class.new }

    before do 
      game_promote.start_game_pieces
    end

    context 'White pawn to promote' do
      before do 
        board = game_promote.board
        board[0][0] = Pawn.new([0,0], 'w')
      end
      it 'changes to white queen' do
        board = game_promote.board
        location = [0, 0]
        game_promote.promote(location)
        expect(board[0][0]).to be_a(Queen)
      end
    end
  end

#   describe '#pawn_attack_possible_updater' do

#     subject(:game_pawn_update) { described_class.new }

#     context 'no pawns in attack position' do

#       before do
#         game_pawn_update.start_game_pieces
#         game_pawn_update.pawn_attack_possible_updater
#       end
#       it 'no update to pawns attack_possible instance variable' do
#         board = game_pawn_update.board
#         pawn = board[6][1]
#         expect(pawn.attack_possible_left).to be false
#       end
#     end

#     context 'pawns in attack position' do
      
#       before do
#         game_pawn_update.start_game_pieces
#         game_pawn_update.pawn_attack_possible_updater
#       end
#       it 'updates pawns attack_possible instance variable' do
        
#         game_pawn_update.move_piece([1, 1], [5, 1])
#         board = game_pawn_update.board
#         pawn = board[6][0]
#         expect(pawn.attack_possible_right).to be true
#       end
#     end
#   end

  describe '#find_king' do
    subject(:game_find_king) { described_class.new } 
    context 'king is at [0, 4]' do
      it 'returns [0, 4]' do
        game_find_king.start_game_pieces
        expect(game_find_king.find_king).to eq([0, 4])
      end
    end
  end

  describe '#in_check?' do
    context 'king is not in check' do
    end

    context 'king is in check' do

    end
  end

  describe '#checking_pieces' do

  end

  describe '#possible_counter_moves' do

  end

  describe '#checkmate?' do

  end
end