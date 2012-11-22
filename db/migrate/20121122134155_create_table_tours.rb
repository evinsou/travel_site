class CreateTableTours < ActiveRecord::Migration
  def up
    create_table :tours do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :from_city, null: false
      t.string :to_city, null: false
      t.date :departure_date, null: false
      t.date :return_date, null: false
      t.decimal :price, null: false
      t.timestamps
    end
  end

  def down
    drop_table :tours
  end
end
