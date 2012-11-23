class BookingsController < ApplicationController
  #before_filter :authenticate_user!
  respond_to :html, :json, :js

  def index
    @bookings = Booking.all
    respond_with @bookings
  end
  def new
    @booking = Booking.new
    respond_with @booking
  end
  def book_tour # check in irb
    @tour = Tour.find params[:id]
    @booking = @tour.bookings.new
    #@booking = Booking.new
    respond_with @booking
  end
  def book_hotel # check in irb
    @tour = Tour.find params[:id]
    @booking = @tour.bookings.new
    #@booking = Booking.new
    respond_with @booking
  end
  def create_booking
    @tour.booking_id = @booking.id
    @booking.tour_id = @tour.id
    @booking.save
    @tour.save
    #but need to save tour or hotel booking.save
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
