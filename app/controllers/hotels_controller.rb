class HotelsController < ApplicationController
  respond_to :html, :json, :js

  def index
    @hotels = Hotel.all
    respond_with @hotels
  end
  def new
    @hotel = Hotel.new
    respond_with @hotel
  end
  def create
    @hotel = Hotel.new(params[:hotel])
    if @hotel.save
      redirect_to hotels_path, :notice => 'new hotel is added'
    else
      render :action => 'new'
    end
  end
  def edit
    @hotel = Hotel.find(params[:id])
    respond_with @hotel
  end
  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update_attributes(params[:hotel])
      redirect_to :action => 'index', :notice => 'hotel #{@hotel.name} updated'
    else
      render :action =>'edit'
    end
  end
  def show
    @hotel = Hotel.find(params[:id])
    respond_with @hotel
  end
  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    redirect_to(hotels_path)
  end

end
