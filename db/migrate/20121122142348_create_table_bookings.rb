class CreateTableBookings < ActiveRecord::Migration
  def up
    create_table :bookings do |t|
      t.integer :user_id
      t.references :bookingable, polymorphic: true
      t.timestamps
    end
  end

  def down
    drop_table :bookings
  end
end
