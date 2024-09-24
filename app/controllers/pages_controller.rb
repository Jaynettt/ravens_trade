class PagesController < ApplicationController
  def dashboard
    @my_goods = Good.where(user: current_user)
  end
end
