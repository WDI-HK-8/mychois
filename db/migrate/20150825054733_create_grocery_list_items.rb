class CreateGroceryListItems < ActiveRecord::Migration
  def change
    create_table :grocery_list_items do |t|
      t.decimal :current_price
      t.integer :quantity
      t.timestamps null: false
    end
  end
end
