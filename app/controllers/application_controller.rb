class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = 'Pleaselog in.'
    redirect_to login_url

  end
end
