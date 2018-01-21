class CirclesController < ApplicationController
    # before_action :authenticate_user!

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

end
