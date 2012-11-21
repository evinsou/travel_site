class RemoveBookingIdFromTours < ActiveRecord::Migration
  def up
    remove_column :tours, :booking_id
  end

  def down
    add_column :tours, :booking_id, :integer
  end
end
