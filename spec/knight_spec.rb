require_relative '../lib/knight.rb'

describe Knight do
  
  describe '#possible_moves' do
    
    subject(:knight_moves) { described_class.new([0, 1], 'b') }

    context 'start position at edge of board' do
      
      it 'gives the correct number of possible moves' do
        start = [0, 1]
        moves = knight_moves.possible_moves(start)
        expect(moves.length).to eq(3)
      end
    end
  end

  describe '#path' do

    subject(:knight_path) { described_class.new([0, 1], 'b') }

    context 'start position at edge of board' do

        it 'gives the correct number of locations along path' do
            start = [0, 1]
            destination = [2, 0]
            path = knight_path.path(start, destination)
            expect(path.length).to eq(2)
        end
    end
  end
end