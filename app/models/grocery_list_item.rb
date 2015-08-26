class GroceryListItem < ActiveRecord::Base
  has_many :grocery_lists
  has_many :users, through: :groceries
end
