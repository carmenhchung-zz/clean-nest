class AppointmentsController < ApplicationController

  before_action :set_appointment
  before_action :authenticate_user!

  def new
    @user = current_user
    @user_id = params[:user_id]
  end

  def show
  end

  def create

    if current_user == @user
      flash[:alert] = "You cannot make a booking for yourself."

    else
    date = Date.parse(appointment_params[:date])
    puts "Date received: " + date.to_s

    @appointment = @user.appointments.build(appointment_params)

    #Pass the user at the top of this method down to this particular appointment.
    @appointment.user = @user
    @appointment.home = @home
    @appointment.save

    flash[:notice] = "You have successfully made an appointment!"
    redirect_to root_path
    end
  end

    def save_appointment
    @cleaner = User.all.last
    Appointment.save_appointment(params, current_user, @cleaner)
    flash[:success] = "Appointment saved"
    redirect_back(fallback_location: :root)
    end

  private

  def set_appointment
# Find the cleaner you are booking
    # @user = User.find(params[:user_id])

# Find the current user (i.e. customer's) homes (to allow them to choose which should be cleaned)
    @homes = Home.find(current_user.id)
    #@homes = Home.where(:user => current_user)
    @appointments = Appointment.where(:home_id => @homes_id).order(date: :asc)
    # @appointments = Appointments.find(params[:home_id => @home.id])

  end

  def appointment_params
    params.require(:appointment).permit(:date, :start_time, :end_time, :hours, :hourly_rate, :total_price)
  end

end
