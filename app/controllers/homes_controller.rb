class HomesController < ApplicationController
  before_action :set_home, except: [:index, :new, :create]
  # Run set home (see private) before all else, except for index, new and create which do not need this method.

  before_action :is_authorised, only: [:show, :edit, :update]
  # Ensures that only the owner of the actual home can view it, edit it, and update it.

  before_action :authenticate_user!
  # All customers need to login.

  def index
    @homes = current_user.homes
  # Lists each user's home(s). Available because in our model, we have set it up so that one user can have many homes.
  end

  def show
  # Shows a profile page for a particular home owned by the user.
  end

  def new
    @home = current_user.homes.build
  # Create a new home - this initialises empty room object in the memory.
  end

  def create
    @home = current_user.homes.build(home_params)
    if @home.save
      redirect_to homes_path, notice: "Successfully saved!"
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :new
    end
  # Create a new home.
  end

  def edit
  end


# Method to delete both the entire home as well as an image for a particular home.
  def destroy
    @home.destroy
    @home.image.destroy
    respond_to :js
    # Responds to javascript - use with ajax
  end

  def update
    if @home.update(home_params)
      redirect_to homes_path, notice: "Successfully saved!"
    else
      flash[:alert] = "Something went wrong. Try again."
    end
  # Allows user to update the home details.
  end

  private
  def set_home
    @home = Home.find(params[:id])
    # Passing this room's ID and set @homes variable - this can now be called by any method above because it is made available in private and run before action.
  end

  def home_params
    params.require(:home).permit(:home_type, :listing_name, :address, :instructions, :hours, :hourly_rate, :supplies_provided, :image, :longtitude, :latitude)
    # To create or update the room, you need to permit the attributes that the user can create/update.
  end

  def is_authorised
    redirect_to homes_path, alert: "You don't have permission to access this." unless current_user.id == @home.user_id
  end
end
