class CreateTableHotels < ActiveRecord::Migration
  def up
    create_table :hotels do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :city, null: false
      t.integer :rating, null: false
      t.timestamps
    end
  end

  def down
    drop_table :hotels
  end
end
