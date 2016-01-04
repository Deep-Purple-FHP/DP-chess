class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :player_id
      t.integer :color
      t.integer :x_position
      t.integer :y_position
      t.string :state
      t.string :picture 
      t.string :type
      

      t.timestamps
    end
  end
end
