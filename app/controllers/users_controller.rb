class UsersController < ApplicationController

  before_action :set_availability, except: [:index, :new, :create]
  # Run set availability (see private) before all else, except for index, new and create which do not need this method.

  before_action :authenticate_user!
  # All customers need to login.

  before_action :is_authorised, only: [:edit, :update, :delete]
  # Ensures that only the cleaner can edit it and delete it.

    def show
    end

    def new
      @availability = current_user.availabilities.build
    # Create a new home - this initialises empty room object in the memory.
    end

    def create
      date = Date.parse(availability_params[:date])
      start_time = Start_time.parse(availability_params[:start_time])
      end_time = End_time.parse(availability_params[:end_time])
      hours = Hours.parse(availability_params[:hours])
      @availability = current_user.availabilities.build(availability_params)

      #Pass the user at the top of this method down to this particular availability.
      @availability.user = user
      if @availability.save
        redirect_to user_path, notice: "Successfully saved!"
      else
        flash[:alert] = "Something went wrong. Please try again."
        render :new
      end
    end

    def edit
    end

    def update
      if @availability.update(availability_params)
        redirect_to user_path, notice: "Successfully saved!"
      else
        flash[:alert] = "Something went wrong. Try again."
      end
    # Allows user to update the availability details.
    end

  # Method to delete the availability.
    def destroy
        @availability.destroy
        respond_to :js
        # Responds to javascript - use with ajax
    end

  private
    def set_availability
      # Pass param ID (i.e. user ID) which is found in the User table. Can be called by any method above now.
      @user = User.find(params[:id])

      # Pass the user ID to the availabilities table.
      @availabilities = @user.availabilities
    end

    def availability_params
      params.require(:availability).permit(:date, :start_time, :end_time, :hours)
      # To create or update availability, you need to permit the attributes that the user can create/update.
    end

    def is_authorised
      redirect_to user_path, alert: "You don't have permission to access this." unless current_user.id == @availability.user_id
    end

  # For making appointments for each user
  # def preload
  #   today = Date.today
  #   # Getting all times where the cleaner has an appointment time that is not today
  #   appointments = @user.appointments.where("date >= ?", today)
  #   render json: reservations
  # end




end
