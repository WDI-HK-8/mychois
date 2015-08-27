class UsersController < ApplicationController
  def change_to_buyer
    if user_signed_in?
      @user = current_user.update_attribute(:type, "Worker")
      render json: @user

    else
      render json: {error: "Unauthorized, Please sign up!"}, :status => :unauthorized
    end
  end
end
