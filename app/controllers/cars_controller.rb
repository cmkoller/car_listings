class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @manufacturer_options = Manufacturer.all.map{|u| [ u.name, u.id ] }
    @car = Car.new(car_params)
    if @car.save
      flash[:info] = "Car successfully created"
      redirect_to cars_path
    else
      flash[:warning] = @car.errors.full_messages.join(".  ")
      render "new"
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  private

  def car_params
    params.require(:car).permit(:manufacturer_id, :color, :year, :mileage, :description)
  end
end
