class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    # remove the old foreign_key
    remove_foreign_key :bookings, :homes
    remove_foreign_key :reviews, :bookings

    # add the new foreign_key
    add_foreign_key :bookings, :homes, on_delete: :cascade
    add_foreign_key :reviews, :bookings, on_delete: :cascade
  end
end
