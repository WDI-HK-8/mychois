class GroceryListItemsController < ApplicationController
  def create
    grocery_list_id = params[:grocery_list_id]
    @grocery_list_item = GroceryListItem.new(grocery_list_item_params)
    @grocery_list_item.grocery_list_id = grocery_list_id
    if @grocery_list_item.grocery.sale_price.nil?
      @grocery_list_item.current_price = @grocery_list_item.grocery.price
    else
      @grocery_list_item.current_price = @grocery_list_item.grocery.sale_price
    end

    @grocery_list_item.total_price = @grocery_list_item.current_price * @grocery_list_item.quantity 

    # Ready to save
    if @grocery_list_item.save
      render json: @grocery_list_item
    else
      render json: {error: "List Not Saved"}, :status => :not_found
    end
  end

  private
    def grocery_list_item_params
      params.require(:grocery_list_item).permit(:quantity, :grocery_id)
    end
end
