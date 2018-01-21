class EventsController < ApplicationController
  def create
    circle = Circle.find(params[:circle_id])
    circle.events.create(event_params)
    redirect_to circle_path(circle)
  end

  def event_params
    params.require(:event).permit(:title, :description, :event_type, :time)
  end

end
