class Game < ActiveRecord::Base

  has_many :players
  has_many :pieces

  after_create :populate_board!


  def populate_board!

    #White Pieces, this loop sets the entire row of pawns
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x_position: i,
        y_position: 6,
        color: true  #assuming boolean value for white = true
        )
    end

    Rook.create(game_id: id, x_position: 0, y_position: 0, color: true)
    Rook.create(game_id: id, x_position: 7, y_position: 0, color: true)

    Knight.create(game_id: id, x_position: 1, y_position: 0, color: true)
    Knight.create(game_id: id, x_position: 6, y_position: 0, color: true)

    Bishop.create(game_id: id, x_position: 2, y_position: 0, color: true)
    Bishop.create(game_id: id, x_position: 5, y_position: 0, color: true)

    Queen.create(game_id: id, x_position: 3, y_position: 0, color: true)
    King.create(game_id: id, x_position: 4, y_position: 0, color: true )
    end

    #Black Pieces, this loop sets the entire row of pawns
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x_position: i,
        y_position: 1,
        color: false  #assuming boolean value for white = true
        )
    end

    Rook.create(game_id: id, x_position: 0, y_position: 7, color: false)
    Rook.create(game_id: id, x_position: 7, y_position: 7, color: true)

    Knight.create(game_id: id, x_position: 1, y_position: 7, color: false)
    Knight.create(game_id: id, x_position: 6, y_position: 7, color: false)

    Bishop.create(game_id: id, x_position: 2, y_position: 7, color: false)
    Bishop.create(game_id: id, x_position: 5, y_position: 7, color: false)

    Queen.create(game_id: id, x_position: 3, y_position: 7, color: false)
    King.create(game_id: id, x_position: 4, y_position: 7, color: false)
    end

  end
