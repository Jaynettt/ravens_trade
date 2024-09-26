class PagesController < ApplicationController
  def dashboard
    @my_goods = Good.where(user: current_user)
    @my_booking = Booking.where(good: @my_goods)
  end
end
