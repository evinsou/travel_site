class ApplicationController < ActionController::Base
  #before_filter :authenticate_user!, except: [:index, :show]
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :render_500
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    rescue_from ActionController::UnknownAction, with: :render_404
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  end

  protected
    def set_locale
      I18n.locale = params[:locale] unless params[:locale].blank?
    end
  private
    def render_404(exception)
      @not_found_path = exception.message
      respond_to do |format|
        format.html { render template: 'errors/error_404', layout: false, status: 404 }
        format.all { render nothing: true, status: 404 }
      end
    end
    def render_500(exception)
      @error = exception
      respond_to do |format|
        format.html { render template: 'errors/error_500', layout: false, status: 500 }
        format.all { render nothing: true, status: 500}
      end
    end
end
