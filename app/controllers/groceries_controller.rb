class GroceriesController < ApplicationController
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
    no_record_found if @grocery.nil?
  end

  def update
    grocery_id = params[:id]
    grocery = groceries_params
    begin
      @grocery = Grocery.update(grocery_id, grocery)
    rescue ActiveRecord::RecordNotFound
      no_record_found
    end
  end

  def destroy
    grocery_id = params[:id]
    
    begin
      @grocery = Grocery.destroy(grocery_id)
    rescue ActiveRecord::RecordNotFound
      no_record_found
    end
  end

  private
    def groceries_params
      params.require(:grocery).permit(:name, :price, :sale_price)
    end
    def no_record_found
      no_record = Hash.new
      no_record[:error] = "Record Not Found"
      render json: no_record, :status => :not_found
    end
end
