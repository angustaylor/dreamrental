class ReviewsController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @reviews = policy_scope(review).order(created_at: :desc)
  end

  def show
  end

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
    authorize @review
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @home = Home.find(@booking[:home_id])
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to home_path(@home), notice: 'review was successfully created.'
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      redirect_to reviews_path(@home), notice: 'review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path(@home), notice: 'review was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = review.find(params[:id])
    authorize @review
  end

  def set_home
   @home = Home.find(params[:id])
    authorize @home
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:rating, :description, :booking)
  end
end
