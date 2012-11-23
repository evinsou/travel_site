class WelcomeController < ApplicationController
  skip_authorization_check
  check_authorization
  def index

  end
end
