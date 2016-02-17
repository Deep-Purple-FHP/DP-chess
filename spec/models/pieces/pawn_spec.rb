require 'rails_helper'
require 'pp'

RSpec.describe Pieces::Pawn do
  let(:game) { Game.create }

  context 'when a black pawn is in the initial position' do
    let(:pawn) do
      game.pieces.black.find_by(type: 'Pieces::Pawn')
    end
    it 'can move forward' do
      expect(
        pawn.move(pawn.x_position, pawn.y_position - 1)
      ).to eq true
    end
    it 'can not move backwards' do
      expect(
        pawn.move(pawn.x_position, pawn.y_position + 1)
      ).to eq false
    end
  end

  context 'when a white pawn is in the initial position' do
    let(:pawn) do
      game.pieces.white.find_by(type: 'Pieces::Pawn')
    end
    it 'can move forward' do
      expect(
        pawn.move(pawn.x_position, pawn.y_position + 1)
      ).to eq true
    end
    it 'can not move backwards' do
      expect(
        pawn.move(pawn.x_position, pawn.y_position - 1)
      ).to eq false
    end
  end
end
