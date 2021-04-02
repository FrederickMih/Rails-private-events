class SessionsController < ApplicationController

  include SessionsHelper

    def new
    end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:username])
      log_in user
      redirect_back_or user
    else
      flash.now[:danger] = 'User does not exist, please Sign-up first'
      render 'new'
    end
  end

  def destroy
    puts "\nARRIVED AT THE DESTROY\n"
    log_out
    redirect_to root_url
  end




end
