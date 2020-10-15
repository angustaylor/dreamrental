class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :telephone_number, :integer
    add_column :users, :country, :string
  end
end
