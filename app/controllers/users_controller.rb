class UsersController < ApplicationController
  before_action :authenticate_user!, :print_hello

  def print_hello
  end

  def dashboard
    if 
    end
    @user = current_user 
  end

  def show
    @user = current_user
    @circle = current_circle

    if not in_circle?
      redirect_to root_path and return
    end
    @events = @circle.events
    @users = @circle.users

    @user
  end

  def in_circle?
    if not current_circle
      # The circle does not exist
      redirect_back fallback_location: root_path and return

    return current_circle.users.include? current_user
  end

  def current_circle
    Circle.find(params[:id])
  end

end
