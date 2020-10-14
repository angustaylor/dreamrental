class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.string :address
      t.string :region
      t.string :country
      t.string :postcode
      t.integer :bedrooms
      t.integer :bathrooms
      t.boolean :swimming_pool
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
