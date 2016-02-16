object @game

attributes :name
attributes :white_player_id
attributes :black_player_id

child(:pieces) do
  attributes :color
  attributes :x_position
  attributes :y_position
  attributes :state
  attributes :symbol
  attributes :type
  node(:icon) do |obj|
    image_path obj.icon
  end
end
