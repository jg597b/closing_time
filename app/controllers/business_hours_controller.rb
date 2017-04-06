class BusinessHoursController < ApplicationController
  before_action :set_business_hour, only: [:show, :edit, :update, :destroy]
  def index
    @business_hours = BusinessHour.all
  end

  def show
  end

  def new
    @business_hour = BusinessHour.new
  end

  def edit
  end

  def create
    @business_hour = BusinessHour.new(business_hour_params)
    @business_hour.save ? (redirect_to locations_path) : (redirect_to new_location_path)

  end

 
  def update
  	    @business_hour.update(business_hour_params) ? (redirect_to locations_path) : (redirect_to new_location_path)
  end

  def destroy
    @business_hour.destroy
    redirect_to locations_path
  end

  private
    def set_business_hour
      @business_hour = BusinessHour.find(params[:id])
    end
    def business_hour_params
      params.require(:business_hour).permit(:location_id, :day, :open_time, :close_time)
    end
end
