class Game::PiecesGenerator
  attr_accessor :game_id

  def initialize(game_id)
    self.game_id = game_id
  end

  def add_piece(type, x, y, color)
    game_id.pieces.create(
      type: type.to_s.classify,
      game_id: self,
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
    (0..7).each { |i| add_piece :pawn, i, 6, 'purple' }
    add_piece :rook, 0, 7, 'purple'
    add_piece :rook, 7, 7, 'purple'
    add_piece :knight, 1, 7, 'purple'
    add_piece :knight, 6, 7, 'purple'
    add_piece :bishop, 2, 7, 'purple'
    add_piece :bishop, 5, 7, 'purple'
    add_piece :queen, 3, 7, 'purple'
    add_piece :king, 4, 7, 'purple'
  end

  def perform
  end

end
