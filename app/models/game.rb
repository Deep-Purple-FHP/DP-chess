class Game < ActiveRecord::Base



  has_many :players
  has_many :pieces


  after_create :populate_board!


  def populate_board!

    #White Pieces, this loop sets the entire row of pawns
    (0..7).each do |i|
      Pawn.new(
        game_id: id,
        x_position: i,
        y_position: 1,
        color: 'white',
        icon: 'white_pawn.png'
      )
    end

    Rook.new(game_id: id, x_position: 0, y_position: 0, color: 'white', icon: 'white_rook.png')
    Rook.new(game_id: id, x_position: 7, y_position: 0, color: 'white', icon: 'white_rook.png')

    Knight.new(game_id: id, x_position: 1, y_position: 0, color: 'white', icon: 'white_knight.png')
    Knight.new(game_id: id, x_position: 6, y_position: 0, color: 'white', icon: 'white_knight.png')

    Bishop.new(game_id: id, x_position: 2, y_position: 0, color: 'white', icon: 'white_bishop.png')
    Bishop.new(game_id: id, x_position: 5, y_position: 0, color: 'white', icon: 'white_bishop.png')

    Queen.new(game_id: id, x_position: 3, y_position: 0, color: 'white', icon: 'white_queen.png')
    King.new(game_id: id, x_position: 4, y_position: 0, color: 'white', icon: 'white_king.png' )

    #Black Pieces, this loop sets the entire row of pawns
    (0..7).each do |i|
      Pawn.new(
        game_id: id,
        x_position: i,
        y_position: 6,
        color: 'black',
        icon: 'purple_pawn.png'
      )
    end

    Rook.new(game_id: id, x_position: 0, y_position: 7, color: 'black', icon: 'purple_rook.png')
    Rook.new(game_id: id, x_position: 7, y_position: 7, color: 'black', icon: 'purple_rook.png')

    Knight.new(game_id: id, x_position: 1, y_position: 7, color: "black", icon: 'purple_knight.png')
    Knight.new(game_id: id, x_position: 6, y_position: 7, color: "black", icon: 'purple_knight.png')

    Bishop.new(game_id: id, x_position: 2, y_position: 7, color: "black", icon: 'purple_knight.png')
    Bishop.new(game_id: id, x_position: 5, y_position: 7, color: "black", icon: 'purple_knight.png')

    Queen.new(game_id: id, x_position: 3, y_position: 7, color: "black", icon: 'purple_queen.png')
    King.new(game_id: id, x_position: 4, y_position: 7, color: "black", icon: 'purple_king.png')
  end

end
