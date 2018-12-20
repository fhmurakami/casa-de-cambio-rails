class HomeController < ApplicationController
  def index
    if params[:currency]
      @transactions = Transaction.where(currency: params[:currency])
    else
      @transactions = Transaction.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day)
    end
    @users = User.all
  end
end
