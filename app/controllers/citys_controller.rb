class CitysController < ApplicationController

  def index
    @city = City.all
    render :index
  end

  def show
    @city = City.find(params[:id])
    render :show
  end

  def new
    @city = City.new
  end

  def create
    city_params = params.require(:city).permit(:name)
    @city = City.create(city_params)
    redirect_to @city # <-- go to city
  end

end
