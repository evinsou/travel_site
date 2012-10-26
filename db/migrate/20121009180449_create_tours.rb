class CreateTours < ActiveRecord::Migration
  def change
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
  end
end
