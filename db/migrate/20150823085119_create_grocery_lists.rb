class CreateGroceryLists < ActiveRecord::Migration
  def change
    create_table :grocery_lists do |t|
      t.decimal :total_price
      t.text :additional_comments
      t.boolean :substitutions
      t.timestamps null: false
    end
  end
end
