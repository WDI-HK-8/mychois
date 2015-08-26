class GroceryListsController < ApplicationController
  before_action :authenticate_user!
  def create
    @grocery_list = GroceryList.new(grocery_list_params)
    @grocery_list[:customer_id] = current_user.id
    @grocery_list.save
    render json: @grocery_list
  end

  def index
    @grocery_lists = GroceryList.where(:customer_id => current_user.id)
  end  

  def destroy
    @grocery_list = GroceryList.find_by_id(params[:id])
    if @grocery_list.nil? 
      render json: {error: "No record found"}, :status => :bad_request
    else
      if current_user.id == @grocery_list.customer_id
        @grocery_list.destroy
      else
        render json: {error: "Unauthorized"}, :status => :unauthorized
      end
    end
  end
  private
    def grocery_list_params
      params.require(:grocery_list).permit(:additional_comments, :substitutions, :name)
    end

end
