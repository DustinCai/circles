class UsersController < ApplicationController
  before_action :authenticate_user!, :print_hello

  def print_hello
  end

  def dashboard
    if 
    end
    @user = current_user 
  end

end
