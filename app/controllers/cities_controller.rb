class CitiesController < ApplicationController

  def index
    @city = City.all
    render :index
  end

  def show
    @city = City.find(params[:id])
    @cities = City.all
    @posts = Post.where(city_id: @city)
    @user = User.find(current_user)
    @current_user= current_user
    @post = Post.new
    render :show
  end

  def new
    @city = City.new
    render :new
  end

  def create
    city_params = params.require(:city).permit(:name, :image)
    @city = City.create(city_params)
    redirect_to @city # <-- go to city
  end

  def edit
    @city = City.find(params[:id])
    render :edit
  end

  def update          
    @city = City.find(params[:id])
    updated_attributes = params.require(:city).permit(:name, :image)
    @city.update_attributes(updated_attributes)
    redirect_to @city 
  end

  def destroy
    @user = User.find(current_user)
    City.destroy(params[:id])
    redirect_to @user
  end

end
