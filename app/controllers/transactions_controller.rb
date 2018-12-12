class TransactionsController < ApplicationController
  def new
    return create if transaction_params

    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
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

  def edit
    return update if transaction_params

    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])
    @transaction.update(transaction_params)
    if @transaction.save
      redirect_to @transaction
    else
      flash[:alert] = 'Você deve informar todos os dados da transação'
      render :edit
    end
  end

  def transaction_params
    return false if params[:transaction].nil? || params[:transaction].empty?

    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type)
  end
end
