class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
  end

  def new
    @booking = Booking.new
    @home = Home.find(params[:home_id])
    authorize @booking
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @home = Home.find(params[:home_id])
    @booking.home = @home
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :amount, :user_id, :home_id)
  end
end
