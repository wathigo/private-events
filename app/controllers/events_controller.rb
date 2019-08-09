# frozen_string_literal: true

class EventsController < ApplicationController
  def new
    @event = current_user.hosting_events.build
  end

  def create
    @event = current_user.hosting_events.build(event_params)
    if @event.save
      flash[:success] = 'Event created!'
      redirect_to root_url
    end
  end

  def destroy; end

  def index
    @event = Event.all
    @events = Event.all.paginate(page: params[:page])
  end

  private

  def micropost_params
    params.require(:event).permit(:title, :description, :date, :location)
  end
end
