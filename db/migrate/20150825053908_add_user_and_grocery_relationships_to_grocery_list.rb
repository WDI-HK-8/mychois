class AddUserAndGroceryRelationshipsToGroceryList < ActiveRecord::Migration
  def change
    add_reference :grocery_lists, :customer, references: :users, index: true
    add_foreign_key :grocery_lists, :users, column: :customer_id

    add_reference :grocery_lists, :worker, references: :users, index: true
    add_foreign_key :grocery_lists, :users, column: :worker_id
  end
end
