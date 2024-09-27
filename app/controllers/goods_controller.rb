class GoodsController < ApplicationController
  def index
    @goods = Good.all
  end

  def show
    @good = Good.find(params[:id])
    @booking = Booking.new
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new(good_params)
    @good.user = current_user
    if @good.save!
      redirect_to good_path(@good)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def good_params
    params.require(:good).permit(:name, :description, :price, :photo)
  end
end
