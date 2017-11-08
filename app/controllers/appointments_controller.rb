class AppointmentsController < ApplicationController

  # before_action :set_appointment, except: [:show]
  before_action :authenticate_user!

  def new
    @customer = current_user
    @homes = Home.find(current_user.id)
    @cleaner = User.find(params[:user_id])
    @date = Date.parse(appointment_params[:date])
  end

  def show
    @homes = Home.find(current_user.id)
    @appointments = Appointment.where(:home_id ==  @homes.id).or(Appointment.where(:user_id == current_user.id))
  end

  def create
    @customer = current_user
    @cleaner = User.find(params[:user_id])
    @homes = Home.find(current_user.id)
    @date = Date.parse(appointment_params[:date])

    if current_user == @user
      flash[:alert] = "You cannot make a booking for yourself."

    else
    @appointment = @cleaner.appointments.build(appointment_params)

    #   @user = User.find_by_id[params(:user_id)]
    #   Appointment.save_appointment(params, current_user, @user)
    #   flash[:success] = "Appointment saved"
    #   redirect_back(fallback_location: :root)
    #
    # date = Date.parse(appointment_params[:date])

    #Pass the user at the top of this method down to this particular appointment.
    @appointment.user = @cleaner
    @appointment.home = @home
    @appointment.save

    flash[:notice] = "You have successfully made an appointment!"
    redirect_to root_path
    end
  end

  def your_appointments
    @appointments = current_user.appointments.order(date: :asc)
    @homes = Home.where(:user_id => current_user.id)
    @bookings = Appointment.where(:home_id => @homes_id).order(date: :asc)
  end

    # def save_appointment
    # @user = User.find_by_id[params(:user_id)]
    # Appointment.save_appointment(params, current_user, @user)
    # flash[:success] = "Appointment saved"
    # redirect_back(fallback_location: :root)
    # end

  private

  def appointment_params
      params.permit(:user_id, :home_id, :date)
  end

  def set_appointment
# Find the user you are booking
    @user = User.find(params[:id])

# Find the current user (i.e. customer's) homes (to allow them to choose which should be cleaned)
    @homes = Home.find(current_user.id)
    #@homes = Home.where(:user => current_user)
    @appointments = Appointment.where(:home_id => @homes_id).order(date: :asc)
    # @appointments = Appointments.find(params[:home_id => @home.id])
  end

end
