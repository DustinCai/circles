class UsersController < ApplicationController
  before_action :authenticate_user!, :get_user

  def dashboard
  end

  def leave_circle
    circle = Circle.find(params[:id])
    circle.users.delete(current_user)
    if circle.users.length == 0
      circle.destroy
    end
    redirect_to root_path
  end


  def get_user
    @user = current_user
  end

end
