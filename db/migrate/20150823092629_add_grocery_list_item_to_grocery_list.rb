class AddGroceryListItemToGroceryList < ActiveRecord::Migration
  def change
    add_reference :grocery_list_items, :grocery, index: true, foreign_key: true
    add_reference :grocery_lists, :grocery_list_item, index: true, foreign_key: true
  end
end
