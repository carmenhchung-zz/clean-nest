class UsersController < ApplicationController
  def show
    @user = User.find_by(params[:id])
    # Pass param ID (i.e. user ID) which is found in the User table.
  end
end
