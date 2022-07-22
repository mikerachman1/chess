require_relative '../lib/queen.rb'

describe Queen do
  
  describe '#possible_moves' do
    
    subject(:queen_moves) { described_class.new([0, 3], 'b') }

    context 'start position at edge of board' do
      
      it 'gives the correct number of possible moves' do
        start = [0, 3]
        moves = queen_moves.possible_moves(start)
        expect(moves.length).to eq(21)
      end
    end
  end

  describe '#path' do

    subject(:queen_path) { described_class.new([0, 3], 'b') }

    context 'start position at edge of board' do

        it 'gives the correct number of locations along path' do
            start = [0, 3]
            destination = [2, 5]
            path = queen_path.path(start, destination)
            expect(path.length).to eq(3)
        end
    end
  end
end