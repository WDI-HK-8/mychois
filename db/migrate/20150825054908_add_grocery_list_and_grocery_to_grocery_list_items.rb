class AddGroceryListAndGroceryToGroceryListItems < ActiveRecord::Migration
  def change
    add_reference :grocery_list_items, :grocery_list, index: true, foreign_key: true
    add_reference :grocery_list_items, :grocery, index: true, foreign_key: true
  end
end
