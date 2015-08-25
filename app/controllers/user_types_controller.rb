class UserTypesController < ApplicationController
  def index
    @usertypes = UserType.all
  end
end
