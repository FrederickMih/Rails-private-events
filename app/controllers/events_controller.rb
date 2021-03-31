class EventsController < ApplicationController

  include SessionsHelper
  before_action :logged_in_user

    def new
        @event = current_user.events.new
    end

    def index 
        @event = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def create
      @event = current_user.events.build(event_params)
      if @event.save
          flash[:success] = "Successfully created a new event"
          redirect_to @event
      else
          render :new
      end
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update_attributes(item_params)
      flash[:success] = "Event updated"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    if @event
      @event.destroy
      flash[:success] = "Event removed"
    else 
      flash[:alert] = "Event removed"
    end 
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit( :description)
  end
end




    