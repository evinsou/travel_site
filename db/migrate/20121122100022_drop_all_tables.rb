class DropAllTables < ActiveRecord::Migration
  def up
    drop_table :hotels
    drop_table :tours
    drop_table :bookings
    drop_table :comments
  end

  def down
    create_table :hotels do |t|
      t.string :title
      t.text :description
      t.string :city
      t.integer :rating

      t.timestamps
    end
    create_table :tours do |t|
      t.string :name
      t.text :description
      t.string :from_city
      t.string :to_city
      t.date :departure_date
      t.date :return_date
      t.decimal :price
      t.timestamps
    end
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
    create_table :comments do |t|
      t.string :name, null: true
      t.text :body, null: false
      t.references :commentable, polymorphic: true
      t.timestamps
    end
  end
end
