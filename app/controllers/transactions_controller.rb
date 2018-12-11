class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_param)
    if @transaction.save
      redirect_to @transaction
    else
      flash[:alert] = 'Você deve informar todos os dados da transação'
      render :new
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def transaction_param
    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type)
  end
end
