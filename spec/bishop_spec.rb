require_relative '../lib/bishop.rb'

describe Bishop do
  
  describe '#possible_moves' do
    
    subject(:bishop_moves) { described_class.new([0, 2], 'b') }

    context 'start position at edge of board' do
      
      it 'gives the correct number of possible moves' do
        start = [0, 2]
        moves = bishop_moves.possible_moves(start)
        expect(moves.length).to eq(7)
      end
    end
  end

  describe '#path' do

    subject(:bishop_path) { described_class.new([0, 2], 'b') }

    context 'start position at edge of board' do

        it 'gives the correct number of locations along path' do
            start = [0, 2]
            destination = [5, 7]
            path = bishop_path.path(start, destination)
            expect(path.length).to eq(6)
        end
    end
  end
end