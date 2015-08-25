class GroceriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :no_record_found
  def index
    @groceries = Grocery.all
  end

  def create
    @grocery = Grocery.new(groceries_params)
    render json: message[:error] = "Error" unless @grocery.save
  end

  def show
    grocery_id = params[:id]
    @grocery = Grocery.find_by_id(grocery_id)
  end

  def update
    grocery_id = params[:id]
    grocery = groceries_params
    @grocery = Grocery.update(grocery_id, grocery)
  end

  def destroy
    grocery_id = params[:id]
    @grocery = Grocery.destroy(grocery_id)
  end

  private
    def groceries_params
      params.require(:grocery).permit(:name, :price, :sale_price)
    end
    def no_record_found
      no_record = Hash.new
      no_record[:error] = "Record Not Found"
      render json: no_record
    end
end
