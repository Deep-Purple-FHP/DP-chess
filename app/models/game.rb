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
        y_position: 1,
        color: 'white',
        icon: 'white_pawn.png'
      )
    end

    Rook.create(game_id: id, x_position: 0, y_position: 0, color: 'white', icon: 'white_rook.png')
    Rook.create(game_id: id, x_position: 7, y_position: 0, color: 'white', icon: 'white_rook.png')

    Knight.create(game_id: id, x_position: 1, y_position: 0, color: 'white', icon: 'white_knight.png')
    Knight.create(game_id: id, x_position: 6, y_position: 0, color: 'white', icon: 'white_knight.png')

    Bishop.create(game_id: id, x_position: 2, y_position: 0, color: 'white', icon: 'white_bishop.png')
    Bishop.create(game_id: id, x_position: 5, y_position: 0, color: 'white', icon: 'white_bishop.png')

    Queen.create(game_id: id, x_position: 3, y_position: 0, color: 'white', icon: 'white_queen.png')
    King.create(game_id: id, x_position: 4, y_position: 0, color: 'white', icon: 'white_king.png' )

    #Black Pieces, this loop sets the entire row of pawns
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x_position: i,
        y_position: 6,
        color: 'black',
        icon: 'purple_pawn.png'
      )
    end

    Rook.create(game_id: id, x_position: 0, y_position: 7, color: 'black', icon: 'purple_rook.png')
    Rook.create(game_id: id, x_position: 7, y_position: 7, color: 'black', icon: 'purple_rook.png')

    Knight.create(game_id: id, x_position: 1, y_position: 7, color: "black", icon: 'purple_knight.png')
    Knight.create(game_id: id, x_position: 6, y_position: 7, color: "black", icon: 'purple_knight.png')

    Bishop.create(game_id: id, x_position: 2, y_position: 7, color: "black", icon: 'purple_knight.png')
    Bishop.create(game_id: id, x_position: 5, y_position: 7, color: "black", icon: 'purple_knight.png')

    Queen.create(game_id: id, x_position: 3, y_position: 7, color: "black", icon: 'purple_queen.png')
    King.create(game_id: id, x_position: 4, y_position: 7, color: "black", icon: 'purple_king.png')
  end

end
