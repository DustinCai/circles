class CirclesController < ApplicationController
    before_action :authenticate_user!

    def new
        @circle = Circle.new
    end

    def create
      circle = Circle.new(group_params)
      if circle.save
        current_user.circles << circle
        redirect_to root_path
      else
        flash[:alert] = circle.errors
        redirect_to new_circle_path
      end
    end

  def group_params
    params.require(:circle).permit(:name, :subject, :status, :size)
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
