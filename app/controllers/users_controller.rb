class UsersController < ApplicationController

# Run set user (see private) before all else, except for index, new and create which do not need this method.
  before_action :set_user, except: [:index, :new, :create]

# All customers need to login.
  before_action :authenticate_user!

    def show
      # @homes = Home.find(current_user.id)
      @cleaner = User.find(params[:id])
      @appointments = Appointment.where(:user_id => @cleaner.id)
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

  private

# Pass param ID (i.e. user ID) which is found in the User table. Can be called by any method above now.
    def set_user
      @user = User.find(params[:id])
      @availabilities = @user.availabilities
      @appointments = Appointment.where(user_id: @user_id)
      # @appointments = Appointment.find(@user.id)
      # @appointments = Appointment.where(user_id: @user.id)
      #@appointments = Appointment.where(:user_id => @user_id)
    end

end
