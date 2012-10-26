class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title
      t.text :description
      t.string :city
      t.integer :rating

      t.timestamps
    end
  end
end
