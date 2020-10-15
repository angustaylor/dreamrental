class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  def index
    @homes = Home.all
  end

  def show
  end

  def new
    @home = Home.new
    @home.user = current_user
  end

  def edit
  end

  def create
    @home = Home.new(home_params)
    @home.user = current_user
    if @home.save
      redirect_to @home, notice: 'Home was successfully created.'
    else
      render :new
    end
  end

  def update
    if @home.update(home_params)
      redirect_to @home, notice: 'Home was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @home.destroy
    redirect_to homes_url, notice: 'Home was successfully destroyed.'
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_home
    @home = Home.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def home_params
    params.require(:home).permit(:address, :region, :country, :postcode, :bedrooms, :bathrooms, :swimming_pool, :description, :user_id, :type, photos: [])
  end
end
