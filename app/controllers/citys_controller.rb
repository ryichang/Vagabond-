class CitysController < ApplicationController

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
    
    render :show
  end

  def new
    @city = City.new

    @all.users = User.all
    @posts= @city.posts.build
  end

  def create
    city_params = params.require(:city).permit(:name)
    @city = City.create(city_params)
    redirect_to @city # <-- go to city
  end

end
