class AddCityToHome < ActiveRecord::Migration[6.0]
  def change
    add_column :homes, :city, :string
  end
end
