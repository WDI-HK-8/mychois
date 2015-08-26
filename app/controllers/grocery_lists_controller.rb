class GroceryListsController < ApplicationController
  # before_action :authenticate_user!
  def create
    @grocery_list = GroceryList.new(grocery_list_params)
    @grocery_list[:customer_id] = current_user.id
    @grocery_list.save
    render json: @grocery_list
  end

  def update
    @grocery_list = GroceryList.find_by_id(params[:id])

    if @grocery_list.nil?
      render #message can't find it

    else
      @grocery_list.update(grocery_list_params)

    end
  end

  def grocery_list_params
    params.require(:grocery_list).permit(:additional_comments, :substitutions, :name)
  end
end
