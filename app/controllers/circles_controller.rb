class CirclesController < ApplicationController
    before_action :authenticate_user!

    def new
        @circle = Circle.new
    end

    def create
      circle = Circle.new(group_params)
      if circle.save
        current_user.circles << circle
        redirect_to circle_path(circle.id)
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
    @new_event = Event.new
    @circle = current_circle

    if not in_circle?
      redirect_to root_path or return
    end
    @events = @circle.events.order :time
    @users = @circle.users
  end

  def search
    @filterrific = initialize_filterrific(
      Circle,
      params[:filterrific],
      select_options: {
        subject_query: Circle.options_for_subject
      }
    ) or return
    
    @circles = @filterrific.find

    respond_to do |format|
      format.html
      format.js
    end

  rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Had to reset filterrific params: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return
  end

  def create_event
  end

  def in_circle?
    if not current_circle
      # The circle does not exist
      redirect_back fallback_location: root_path and return
    end

    if current_circle.size > current_circle.users.length and !current_circle.users.include? current_user
      current_circle.users << current_user
    end
    return current_circle.users.include? current_user
  end

  def current_circle
    Circle.find(params[:id]) rescue false
  end

end
