class BookingsController < ApplicationController
  def index
    @my_bookings = Booking.where(user_id: current_user.id)
    @my_goods = current_user.goods

  end


end
