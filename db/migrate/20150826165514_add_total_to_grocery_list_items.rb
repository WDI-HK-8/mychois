class AddTotalToGroceryListItems < ActiveRecord::Migration
  def change
    change_table :grocery_list_items do |t|
      t.decimal :total_price
    end
  end
end
