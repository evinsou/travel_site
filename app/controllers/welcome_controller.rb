class WelcomeController < ApplicationController
  skip_authorization_check
  check_authorization
  def index
    @tour = Tour.new
    @booking = Booking.new
    @hotel = Hotel.new
  end
end
