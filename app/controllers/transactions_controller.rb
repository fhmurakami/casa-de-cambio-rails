class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(:amount, :currency, :quotation, :transaction_type)
    @transaction.save
    redirect_to root_path
  end

  def show
    @transaction = Transaction.find(params[:id])
  end
end
