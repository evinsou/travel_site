class AddPolymorphicToBookings < ActiveRecord::Migration
  def change
    change_table :bookings do |t|
      t.references :bookingable, polymorphic: true
    end
  end
end