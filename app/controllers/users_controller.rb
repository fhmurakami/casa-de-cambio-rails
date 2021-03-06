class UsersController < ApplicationController
  def index
    @users = User.all
    @addresses = Address.all
  end

  def new
    return create if user_params

    @user = User.new
    @addresses = Address.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      @addresses = Address.all
      flash.now[:alert] = 'Você deve informar todos os dados do usuário'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    return update if user_params

    @user = User.find(params[:id])
    @addresses = Address.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to @user
    else
      @addresses = Address.all
      flash.now[:alert] = 'Você deve informar todos os dados do usuário'
      render :edit
    end
  end

  private

  def user_params
    return false if params[:user].nil? || params[:user].empty?

    params.require(:user).permit(:name, :email, :cpf, :address_id)
  end
end
