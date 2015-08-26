class Grocery < ActiveRecord::Base
  has_many :grocery_list_items
  has_many :users, through: :grocery_list_items
end
