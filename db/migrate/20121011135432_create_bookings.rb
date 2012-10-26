class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :tour
      t.string :hotel
      t.string :email
      t.string :person_name
      t.string :phone
      t.integer :number_of_adults
      t.integer :number_of_children

      t.timestamps
    end
  end
end
