class BookingsController < ApplicationController
  #before_filter :authenticate_user!
  before_filter :find_bookingable
  respond_to :html, :json, :js

  def index
    @bookings = @bookingable.bookings
    respond_with @bookings
  end
  def new
    @booking = @bookingable.bookings.new
    if params[:hotel_id]
      @hotel = Hotel.find params[:hotel_id]
    elsif params[:tour_id]
      @tour = Tour.find params[:tour_id]
    end
    respond_with @booking
  end
  def create
    @booking = @bookingable.bookings.new(params[:booking])
    if @booking.save
      redirect_to [@bookingable, :bookings], :notice => 'booking  created.'
    else
      render :action => 'new'
    end
  end
  def edit
    @booking = @bookingable.bookings.find params[:id]
    respond_with @booking
  end
  def update
    @booking = @bookingable.bookings.find
    if @booking.update_attributes(params[:booking])
      redirect_to [@bookingable, :bookings], :notice => 'booking  updated'
    else
      render :action =>'edit'
    end
  end
  def show
    @booking = @bookingable.bookings.find params[:id]
    respond_with @booking
  end
  def destroy
    @booking = @bookingable.bookings.find params[:id]
    @booking.destroy
    redirect_to bookings_path
  end
  private
    def find_bookingable
      @bookingable = if params[:hotel_id]
#        current_user.hotels.find(params[:hotel_id])
        Hotel.find(params[:hotel_id])
      elsif params([:tour_id])
#        current_user.tours.find(params[:tour_id])
        Tour.find(params[:tour_id])
      end
    end
end
