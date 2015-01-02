class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:info] = "Manufacturer successfully added"
      redirect_to manufacturers_path
    else
      flash[:warning] = @manufacturer.errors.full_messages.join(".  ")
      render "new"
    end
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
