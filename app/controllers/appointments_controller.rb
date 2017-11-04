class AppointmentsController < ApplicationController

  # For making appointments for each user
  # def preload
  #   today = Date.today
  #   # Getting all times where the cleaner has an appointment time that is not today
  #   appointments = @user.appointments.where("date >= ?", today)
  #   render json: reservations
  # end

  before_action :authenticate_user!

  def create
    # Find the user you are booking
    user = User.find(params[:user_id])

    if current_user == user
      flash[:alert] = "You cannot make a booking for yourself."
    else

    date = Date.parse(appointment_params[:date])
    start_time = Start_time.parse(appointment_params[:start_time])
    end_time = (start_time + hours)
    hours = Hours.parse(appointment_params[:hours])
    hourly_rate = Hourly_rate.parse(appointment_params[:hourly_rate])
    total_price = (hours * hourly_rate)

    @appointment = current_user.appointments.build(appointment_params)

    #Pass the user at the top of this method down to this particular appointment.
    @appointment.user = user
    @appointment.save

    flash[:notice] = "Successfully made an appointment!"
    redirect_to user
    end
  end

  def your_appointments
    @appointments = current_user.appointments.order(date: :asc)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :start_time, :end_time, :hours, :hourly_rate, :total_price)
  end

end
