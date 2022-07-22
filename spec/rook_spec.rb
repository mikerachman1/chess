require_relative '../lib/rook.rb'

describe Rook do
  
  describe '#possible_moves' do
    
    subject(:rook_moves) { described_class.new([0, 0], 'b') }

    context 'start position at edge of board' do
      
      it 'gives the correct number of possible moves' do
        start = [0, 0]
        moves = rook_moves.possible_moves(start)
        expect(moves.length).to eq(14)
      end
    end
  end

  describe '#path' do

    subject(:rook_path) { described_class.new([0, 0], 'b') }

    context 'start position at edge of board' do

        it 'gives the correct number of locations along path' do
            start = [0, 0]
            destination = [0, 5]
            path = rook_path.path(start, destination)
            expect(path.length).to eq(6)
        end
    end
  end
end