class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name, null: true
      t.text :body, null: false
      t.references :commentable, polymorphic: true
      t.timestamps
    end
  end
end