class GroceryListsController < ApplicationController
  # before_action :authenticate_user!
  def create
    @grocery_list = GroceryList.new(grocery_list_params)
    @grocery_list[:customer_id] = current_user.id
    @grocery_list.save
  end

  def update
    @grocery_list = GroceryList.find_by_id(params[:id])

    if @grocery_list.nil?
      render json: { message: "Cannot find the grocery list" }, status: :not_found
    else
      if @grocery_list.customer_id == current_user.id
        @grocery_list.update(grocery_list_params)
      else  
        render json: { message: "Cannot update list" }, :status => :bad_request 
      end
    end
  end

  def index
    @grocery_lists = GroceryList.where(:customer_id => current_user.id)
  end 

  def grocery_list_params
    params.require(:grocery_list).permit(:additional_comments, :substitutions, :name)
  end
end
