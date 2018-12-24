class AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def new
    return create if address_params

    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to @address
    else
      flash.now[:alert] = 'Você deve informar todos os dados do endereço'
      render :new
    end
  end

  def show
    @address = Address.find(params[:id])
  end

  def edit
    return update if address_params

    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    if @address.save
      redirect_to @address
    else
      flash.now[:alert] = 'Você deve informar todos os dados do endereço'
      render :edit
    end
  end

  private

  def address_params
    return false if params[:address].nil? || params[:address].empty?

    params.require(:address).permit(:street, :city, :state, :neighbourhood, :postal_code)
  end
end
