class AddUsersToGroceryList < ActiveRecord::Migration
  def change
    add_reference :grocery_lists, :customer, references: :users, index: true
    add_foreign_key :grocery_lists, :users, column: :customer_id
    add_reference :grocery_lists, :shopper, references: :users, index: true
    add_foreign_key :grocery_lists, :users, column: :shopper_id
  end
end
