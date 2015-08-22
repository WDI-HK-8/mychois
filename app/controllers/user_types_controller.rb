class UserTypesController < ApplicationController
  def index
    @usertypes = UserType.all
  end

  def create
    @usertype = UserType.new(usertype_params)
    render json: { message: "Cannot create the user type"}, status: :bad_request unless @usertype.save
  end

  private
  def usertype_params
    params.require(:usertype).permit(:name)
  end
end
