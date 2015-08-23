class CreateGroceryListItems < ActiveRecord::Migration
  def change
    create_table :grocery_list_items do |t|

      t.integer :quantity
      t.decimal :current_price
      t.timestamps null: false
    end
  end
end
