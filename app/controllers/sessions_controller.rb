class SessionsController < ApplicationController
  include SessionsHelper

  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user
      log_in user
      redirect_back_or user
    else
      flash.now[:danger] = 'User does not exist, please Sign-up first'
      render 'new'
    end
  end
end
