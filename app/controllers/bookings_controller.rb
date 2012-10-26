class BookingsController < ApplicationController
  respond_to :html, :json, :js

  def index
    @bookings = Booking.all
    respond_with @bookings
  end
  def new
    @booking = Booking.new
    respond_with @booking
  end
  def create
    @booking = Booking.new(params[:booking])
    if @booking.save
      redirect_to bookings_path, :notice => 'new booking is added'
    else
      render :action => 'new'
    end
  end
  def edit
    @booking = Booking.find(params[:id])
    respond_with @booking
  end
  def update
    @booking = Booking.find(params[:id])
    if @booking.update_attributes(params[:booking])
      redirect_to :action => 'index', :notice => 'booking  updated'
    else
      render :action =>'edit'
    end
  end
  def show
    @booking = Booking.find(params[:id])
    respond_with @booking
  end
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to(bookings_path)
  end
end
