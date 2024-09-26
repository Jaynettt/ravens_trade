class BookingsController < ApplicationController
  before_action :set_booking, only: %i[destroy edit update show accept decline]

  def index
    @my_bookings = Booking.where(user_id: current_user.id)
    @my_goods = current_user.goods
  end

  def show
    @good = @booking.good
  end

  def new
    @good = Good.find(params[:good_id])
    @booking = Booking.new
  end

  def create
    @good = Good.find(params[:good_id])
    @booking = Booking.new(bookings_params)
    @booking.good = @good
    @booking.user = current_user
    @booking.total_price = @booking.calculate_total_price
    @booking.save
    redirect_to booking_path(@booking)
  end

  def edit
  end

  def update
    @booking.update(bookings_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end


  def accept
    @booking.update(status: 1)
    redirect_to dashboard_path
  end

  def decline
    @booking.update(status: 2)
    redirect_to dashboard_path
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :status)
  end

end
