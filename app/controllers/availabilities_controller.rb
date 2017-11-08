class AvailabilitiesController < ApplicationController

# Run set availability (see private) before all else, except for index, new and create which do not need this method.
  before_action :set_availability, except: [:index, :new, :create]

# Ensures that only the cleaner can edit it and delete it.
  before_action :is_authorised, only: [:edit, :update, :delete]

    def index
      redirect_to users_path(current_user.id)
    end

    def show
    end

# Create a new availability - this initialises empty room object in the memory.
    def new
      @user = current_user
      @availability = current_user.availabilities.build
    end

    def create
      @user = current_user
      # date = Date.parse(:date)
      # start_time = Time.parse(availability_params[:start_time])
      # end_time = Time.parse(availability_params[:end_time])
      # hours = (end_time - start_time).to_i
      @availability = current_user.availabilities.build(availability_params)

#Pass the user at the top of this method down to this particular availability.
      # @availability.user = user
      if @availability.save
        redirect_to user_path(current_user.id), notice: "Successfully saved!"
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
      @availability = Availability.find(params[:id])
      @availability.destroy
      redirect_to user_path(@user)
    end

  private
    def set_availability
# Pass param ID (i.e. user ID) which is found in the User table. Can be called by any method above now.
      @user = current_user

# Pass the user ID to the availabilities table.
      @availability = @user.availabilities
    end

# To create or update availability, you need to permit the attributes that the user can create/update.
    def availability_params
      params.require(:availability).permit(:date, :user_id)
    end

    def is_authorised
      redirect_to user_path, alert: "You don't have permission to access this." unless current_user.id == @user.id
    end

end
