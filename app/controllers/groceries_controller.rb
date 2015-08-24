class GroceriesController < ApplicationController
  def index
    @groceries = Grocery.all
  end
end
