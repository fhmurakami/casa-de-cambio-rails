class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def new
    return create if transaction_params

    @transaction = Transaction.new
    @users = User.all
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to @transaction
    else
      @users = User.all
      flash.now[:alert] = 'Você deve informar todos os dados da transação'
      render :new
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def edit
    return update if transaction_params

    @transaction = Transaction.find(params[:id])
    @users = User.all
  end

  def update
    @transaction = Transaction.find(params[:id])
    @transaction.update(transaction_params)
    if @transaction.save
      redirect_to @transaction
    else
      @users = User.all
      flash.now[:alert] = 'Você deve informar todos os dados da transação'
      render :edit
    end
  end

  def destroy
    transaction = Transaction.find(params[:id])
    transaction.destroy
    redirect_to root_path
    flash[:alert] = 'Transação apagada com sucesso!'
  end

  private

  def transaction_params
    return false if params[:transaction].nil? || params[:transaction].empty?

    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type, :user_id)
  end
end
