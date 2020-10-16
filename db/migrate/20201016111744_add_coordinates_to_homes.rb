class AddCoordinatesToHomes < ActiveRecord::Migration[6.0]
  def change
    add_column :homes, :latitude, :float
    add_column :homes, :longitude, :float
  end
end
