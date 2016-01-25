class Game < ActiveRecord::Base
  has_many :players
  has_many :pieces

  after_create :populate_board

  def populate_board
    PiecesGenerator.new(self).populate_board

  end


end
