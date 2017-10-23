class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # Pass param ID (i.e. user ID) which is found in the User table.
  end
end
