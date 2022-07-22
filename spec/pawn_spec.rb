require_relative '../lib/pawn.rb'

describe Pawn do
  
  describe '#possible_moves' do
    
    subject(:pawn_moves) { described_class.new([1, 0], 'b') }

    context 'start position, @first_move = true, both attack possible false' do
      
      it 'gives the correct number of possible moves' do
        start = [1, 0]
        moves = pawn_moves.possible_moves(start)
        expect(moves.length).to eq(2)
      end
    end

    context '@first_move = false, and @attack_possible_left = true' do
      
      before do
        pawn_moves.instance_variable_set(:@attack_possible_left, true)
        pawn_moves.instance_variable_set(:@first_move, false)
      end
      
      it 'gives the correct number of possible moves' do
        start = [1, 0]
        moves = pawn_moves.possible_moves(start)
        expect(moves.length).to eq(1)
      end
    end
  end

  describe '#path' do

    subject(:pawn_path) { described_class.new([1, 0], 'b') }

    context 'start position at edge of board' do

        it 'gives the correct number of locations along path' do
            start = [1, 0]
            destination = [2, 0]
            path = pawn_path.path(start, destination)
            expect(path.length).to eq(2)
        end
    end
  end
end