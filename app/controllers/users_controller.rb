class UsersController < ApplicationController
#   before_action :authenticate_user!, except: [:new]

  def new
      @user = User.new
  end

  def index
  @user = User.all
end

def show
   @user = User.find(params[:id])
end

  def create
      @user = User.new(user_params)

      if @user.save
          @user = User.all
          render :show
      else
          render :new
      end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end