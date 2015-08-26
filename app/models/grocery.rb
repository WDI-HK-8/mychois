class Grocery < ActiveRecord::Base
  has_many :grocery_list_items
end
