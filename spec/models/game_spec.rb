require 'rails_helper'
require 'pp'

RSpec.describe Game::PiecesGenerator do
  it 'creates 32 pieces' do
    game = Game.new
    # game.players << User.create
    expect(game).to receive(:populate_board).and_call_original
    game.save!

    # Game.skip_callback(:create, :after, :populate_board)

    expect(game.pieces.count).to eq(32)

    pieces = game.pieces
             .group_by(&:type)
             .map { |k, v| [k, v.count] }.to_h

    expect(pieces['Pieces::Pawn']).to eq(16)
    expect(pieces['Pieces::Knight']).to eq(4)
    expect(pieces['Pieces::Rook']).to eq(4)
    expect(pieces['Pieces::Bishop']).to eq(4)
    expect(pieces['Pieces::Queen']).to eq(2)
    expect(pieces['Pieces::King']).to eq(2)
  end
end
