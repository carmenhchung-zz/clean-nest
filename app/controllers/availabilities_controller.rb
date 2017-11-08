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
      date = Date.parse(availability_params[:date])
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


    def create_availability
        @availability = Availability.new
        @availability.user_id = 1
        @availability.date = Date.parse(params[:date])
        @availability.start_time = '09:30:00 +1100'
        @availability.end_time = '10:30:00 +1100'
        @availability.hours = 1
        @availability.save
        render :layout => false

      end

      def check_availability
        @user_id = params[:user_id]
        @date = params[:date]
        @start_time = params[:start_time].to_s + ":00"
        @start_time = ApplicationRecord.convert_time_to_number(@start_time)
        @end_time = params[:end_time].to_s + ":00"
        @end_time = ApplicationRecord.convert_time_to_number(@end_time)
        @cleaner = User.find_by_id(@user_id)
        @availabilities = Availability.where(:date => @date, :user => @cleaner)
        @message = params
        @result = "Yes"
        puts @start_time.to_s + " " + @end_time.to_s
        if @availabilities.size == 0 then @result = "No" end
        @is_included_in_at_least_one_availability = false
        for @availability in @availabilities do
          @aval_start_time = ApplicationRecord.convert_time_to_number(@availability.start_time.to_s[11..17])
          @aval_end_time = ApplicationRecord.convert_time_to_number(@availability.end_time.to_s[11..17])
          #puts @aval_start_time.to_s + " " + @aval_end_time.to_s
          if @aval_start_time <= @start_time and @end_time <= @aval_end_time then @is_included_in_at_least_one_availability = true end
        end
        if @is_included_in_at_least_one_availability == false then @result = "No" end
        @appointments = Appointment.where(:date => @date, :user => @cleaner)
        @is_there_a_conflict_between_appointments = false
        for @appointment in @appointments do
          @app_start_time = ApplicationRecord.convert_time_to_number(@appointment.start_time.to_s[11..17])
          @app_end_time = ApplicationRecord.convert_time_to_number(@appointment.end_time.to_s[11..17])
          if @app_start_time <= @start_time and @start_time <= @app_end_time then @result = "No" end
          if @app_start_time <= @end_time and @end_time <= @app_end_time then @result = "No" end
          #puts @app_start_time.to_s + " " + @app_end_time.to_s
        end
        render :layout => false
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
      #params.permit(:date, :user_id)
    end

    def is_authorised
      redirect_to user_path, alert: "You don't have permission to access this." unless current_user.id == @user.id
    end

end
