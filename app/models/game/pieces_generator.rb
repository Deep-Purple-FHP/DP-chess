class Game::PiecesGenerator
  attr_accessor :game

  def initialize(game)
    self.game = game
  end

  def add_piece(type, x, y, color)
    game.pieces.create(
      type: type.to_s.classify,
      game: self,
      x_position: x, y_position: y, color: color,
      icon: "#{color}_#{type}.png")
  end

  def populate_white_pieces
    (0..7).each { |i| add_piece :pawn, i, 1, 'white' }
    add_piece :rook, 0, 0, 'white'
    add_piece :rook, 7, 0, 'white'
    add_piece :knight, 1, 0, 'white'
    add_piece :knight, 6, 0, 'white'
    add_piece :bishop, 2, 0, 'white'
    add_piece :bishop, 5, 0, 'white'
    add_piece :queen, 3, 0, 'white'
    add_piece :king, 4, 0, 'white'
  end

  def populate_board
    populate_black_pieces
    populate_white_pieces
  end

  def populate_black_pieces
    (0..7).each { |i| add_piece :pawn, i, 6, 'black' }
    add_piece :rook, 0, 7, 'black'
    add_piece :rook, 7, 7, 'black'
    add_piece :knight, 1, 7, 'black'
    add_piece :knight, 6, 7, 'black'
    add_piece :bishop, 2, 7, 'black'
    add_piece :bishop, 5, 7, 'black'
    add_piece :queen, 3, 7, 'black'
    add_piece :king, 4, 7, 'black'
  end
end
