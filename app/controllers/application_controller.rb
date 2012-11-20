class ApplicationController < ActionController::Base
  before_filter :for_search
  protect_from_forgery
    def for_search #here or in separate action
    @search_hotels = Hotel.search(params[:q])
    @hotels = @search_hotels.result
    @search_tours = Tour.search(params[:q])
    @tours = @search_tours.result
    end
end
