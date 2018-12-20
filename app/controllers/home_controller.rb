class HomeController < ApplicationController
  def index
    if params[:currency]
      @transactions = Transaction.where(currency: params[:currency])
    else
      @transactions = Transaction.all
    end
    @users = User.all
  end
end
