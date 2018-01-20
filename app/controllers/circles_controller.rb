class CirclesController < ApplicationController

  def new
  end

  def show
    @user = current_user
    @circle = current_circle

    if not in_circle?
      redirect_to root_path and return
    end
    @events = @circle.events
    @users = @circle.users

  end

  def in_circle?
    if not current_circle
      # The circle does not exist
      redirect_back fallback_location: root_path and return
    end

    return current_circle.users.include? current_user
  end

  def current_circle
    Circle.find(params[:id])
  end
end
