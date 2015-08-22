class DistrictsController < ApplicationController
  def index
    @districts = District.all 
  end

  def create
    @district = District.new(district_params)
    render json: { message: "Cannot create the district"}, status: :bad_request unless @district.save
  end
  private
  def district_params
    params.require(:district).permit(:name)
  end
end
