class EventsController < ApplicationController
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to root_url
    end
  end

  def destroy

  end

  def index
    @events = Event.all.paginate(page: params[:page])
  end

  def show
    @user = current_user
  end

  private

    def micropost_params
      params.require(:event).permit(:title, :description, :date, :location)
    end
end
