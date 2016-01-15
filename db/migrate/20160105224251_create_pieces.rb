class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string   :color
      t.integer  :x_position
      t.integer  :y_position
      t.string   :state
      t.string   :symbol
      t.string   :type
      t.timestamps
    end
  end
end
