class HomesController < ApplicationController
  before_action :set_home, except: [:index, :new, :create]
  # Run set home (see private) before all else, except for index, new and create which do not need this method.

  before_action :authenticate_user!, except: [:show]
  # All customers need to login to do anything other than see the listing page. Seeing the listing page (show) is public though.

  def index
    @homes = current_user.homes
  # Shows each user's home(s). Available because in our model, we have set it up so that one user can have many homes.
  end

  def show
    @home = current_user.homes.build
  # Shows all homes - these are publicly available.
  end


  def new
    @home = current_user.homes.build
  # Create a new home - this initialises empty room object in the memory.
  end

  def create
    @home = current_user.homes.build(home_params)
    if @home.save
      redirect_to listing_home_path(@home), notice: "Successfully saved!"
    else
      flash[:alert] = "Something went wrong. Try again."
    end
  # Create a new home.
  end

  def listing

  # Shows a home's full details.
  end

  def update
    if @home.update(home_params)
      flash[:alert] = "Successfully saved!"
    else
      flash[:alert] = "Something went wrong. Try again."
    end
    redirect_back(fallback_location: request.referer)
  # This will take you back to the current page that you were on before.
  # Allows user to update the home details.
  end

  private
  def set_home
    @home = Home.find(params[:id])
    # Passing this room's ID and set @homes variable - this can now be called by any method above because it is made available in private and run before action.
  end

  def home_params
    params.require(:home).permit(:home_type, :listing_name, :address, :instructions, :hours, :hourly_rate, :supplies_provided)
    # To create or update the room, you need to permit the attributes that the user can create/update.
  end
end
