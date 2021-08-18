class AddCountryLongToHomes < ActiveRecord::Migration[6.1]
  def change
    add_column :homes, :country_long, :string
  end
end
