class EventsController < ApplicationController

  include SessionsHelper
  # before_action :logged_in_user, only: [:index]

    def new
        @event = Event.new
    end

    def index 
        @event = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def create
      # @event = Event.new(event_params)
      event_creator = current_user
      @event = event_creator.events.build(event_params)
      @event.save

      if @event.save
          flash[:success] = "Successfully created a new event"
          redirect_to @event
      else
          render :new
      end
  end

  private

  def event_params
    params.require(:event).permit( :description)
  end
end




    