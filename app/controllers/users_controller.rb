class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # Pass param ID (i.e. user ID) which is found in the User table.
  end

  # For making appointments for each user
  def preload
    today = Date.today
    # Getting all times where the cleaner has an appointment time that is not today
    appointments = @user.appointments.where("date >= ?", today)
    render json: reservations
  end

end
