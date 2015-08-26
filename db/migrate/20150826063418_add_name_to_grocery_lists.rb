class AddNameToGroceryLists < ActiveRecord::Migration
  def change
    change_table :grocery_lists do |t|
      t.string :name
    end
  end
end
