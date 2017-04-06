class LocationsController < ApplicationController

  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

 def create
    @location = Location.new(location_params)
    #ternary operator rules
    @location.save ? (redirect_to locations_path) : (redirect_to new_location_path)
  end

  def edit
  end

  def update 
    @location.update(location_params) ? (redirect_to locations_path) : (redirect_to edit_location_path(location))     
  end

  def destroy
    @location.destroy
    redirect_to locations_path
  end
  
  private
  def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name, :description)
    end

end
