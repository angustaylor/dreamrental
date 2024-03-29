class HomesController < ApplicationController
  before_action :set_home, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @homes = policy_scope(
        Home.search_by_location(params[:query])
      ).order(created_at: :desc)
    else
      @homes = policy_scope(Home).order(created_at: :desc)
    end

    @markers = @homes.geocoded.map do |home|
      {
        lat: home.latitude,
        lng: home.longitude
      }
    end
  end

  def show
    @home = Home.includes(:reviews).find(params[:id])
    authorize @home
  end

  def new
    @home = Home.new
    @home.user = current_user
    authorize @home
  end

  def edit
  end

  def create
    @home = Home.new(home_params)
    @home.user = current_user
    @home.country_long = country_name(@home.country)
    @home.full_address = "#{@home.address} #{@home.city}, #{@home.country_long}"
    authorize @home
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
    authorize @home
  end

  # Only allow a list of trusted parameters through.
  def home_params
    params.require(:home).permit(:address, :city, :region, :country, :postcode, :country_long, :bedrooms, :bathrooms, :swimming_pool, :description, :user_id, :type, photos: [])
  end

  def country_name(country)
    country_name = ISO3166::Country[country]
    country_name.translations[I18n.locale.to_s] || country_name.name
  end

end
