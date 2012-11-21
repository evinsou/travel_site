class RemoveBookingIdFromHotels < ActiveRecord::Migration
  def up
    remove_column :hotels, :booking_id
  end

  def down
    add_column :hotels, :booking_id, :integer
  end
end
