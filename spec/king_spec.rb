require_relative '../lib/king.rb'

describe King do
  
  describe '#possible_moves' do
    
    subject(:king_moves) { described_class.new([0, 4], 'b') }

    context 'start position at edge of board' do
      
      it 'gives the correct number of possible moves' do
        start = [0, 4]
        moves = king_moves.possible_moves(start)
        expect(moves.length).to eq(5)
      end
    end
  end

  describe '#path' do

    subject(:king_path) { described_class.new([0, 4], 'b') }

    context 'start position at edge of board' do

        it 'gives the correct number of locations along path' do
            start = [0, 4]
            destination = [1, 4]
            path = king_path.path(start, destination)
            expect(path.length).to eq(2)
        end
    end
  end
end