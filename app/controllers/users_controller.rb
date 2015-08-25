class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :no_record_found

  def change_user_types
    user = user_type_params
    user_id = params[:id]
    @user = User.update(user_id, user_type_id: user[:user_type_id])

  end

  def search_user_types
    user_types = params[:id]
    @users = User.where(user_type_id: user_types)
  end

  private

    def user_type_params
      params.require(:user).permit(:user_type_id)
    end

    def no_record_found
      no_record = Hash.new
      no_record[:message] = "Record Not Found"
      render json: no_record
    end
end
