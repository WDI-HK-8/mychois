class GroceryListsController < ApplicationController
  # before_action :authenticate_user!
  def create
    @grocery_list = GroceryList.new(grocery_list_params)
    @grocery_list[:customer_id] = current_user.id
    @grocery_list.save
  end

  def update
    @grocery_list.customer == current_user

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

  def show
    @grocery_list = GroceryList.find_by_id(params[:id])

    if @grocery_list.nil?
      render json: { message: "Cannot find the specific grocery list" }, status: :not_found
    end
  end


  def index
    @grocery_lists = GroceryList.where(:customer_id => current_user.id)
  end  

  def destroy
    @grocery_list = GroceryList.find_by_id(params[:id])
    if @grocery_list.nil? 
      render json: {error: "No record found"}, :status => :not_found
    else
      if current_user.id == @grocery_list.customer_id
        @grocery_list.destroy
      else
        render json: {error: "Unauthorized"}, :status => :unauthorized
      end
    end
  end

  def buyer_index
    @grocery_lists = GroceryList.where(:worker_id => nil)
  end

  def add_worker_to_list
    grocery_list_id = params[:id]
    grocery = GroceryList.update(grocery_list_id, :worker_id => current_user.id)
    render json: {message: "Your ID has been added to the list!"}
  end

  private
    def grocery_list_params
      params.require(:grocery_list).permit(:additional_comments, :substitutions, :name)
    end

end
