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

  def attend
    @event = Event.find(params[:id])
    @event.attendees << current_user
    redirect_to root_path
  end

  def leave
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    redirect_to root_path
  end

  def show
    @event = Event.find(params[:id])
    @users = @event.attendees
  end

  def index
    @events = Event.all.paginate(page: params[:page])
  end

  private

  def micropost_params
    params.require(:event).permit(:title, :description, :date, :location)
  end
end
