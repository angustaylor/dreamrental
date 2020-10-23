class AddFulladdressToHome < ActiveRecord::Migration[6.0]
  def change
    add_column :homes, :full_address, :string
  end
end
