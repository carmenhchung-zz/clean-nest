class AppointmentsController < ApplicationController

  # before_action :set_appointment, except: [:show]
  before_action :authenticate_user!

  def new
    @customer = current_user
    @homes = Home.find(current_user.id)
    @cleaner = User.find(params[:user_id])
    @date = Date.parse(appointment_params[:date])
    @appointment = @cleaner.appointments.build
  end

  def show
    @homes = Home.find(current_user.id)
    @cleaner = User.find(params[:user_id])
    @appointments = Appointment.where(:user_id == @cleaner.id)

  end

  def create
    @customer = current_user
    @cleaner = User.find(params[:user_id])
    @homes = Home.find(current_user.id)
    @date = Date.parse(appointment_params[:date])

    if current_user == @user
      flash[:alert] = "You cannot make a booking for yourself."

    else
    @appointment = Appointment.new(appointment_params)
    # @appointment = @cleaner.appointments.build(appointment_params)
    puts "="*12
    puts params[:user_id]
    puts "="*12
    # puts "="*12
    # puts @appointment.inspect
    # puts "="*12
#Pass the user at the top of this method down to this particular appointment.
    # @appointment.user = @cleaner
    # @appointment.home_id = @home.id
      @appointment.save!

      puts "="*12
      puts @appointment.inspect
      puts "="*12

      flash[:notice] = "You have successfully made an appointment!"
      redirect_to root_path
    end
  end

  def your_appointments
    @appointments = current_user.appointments.order(date: :asc)
    @homes = Home.where(:user_id => current_user.id)
    @bookings = Appointment.where(:home_id => @homes_id).order(date: :asc)
  end

  private

  def appointment_params
      params.permit(:user_id, :home_id, :date)
  end

  def set_appointment
# Find the user you are booking
    @user = User.find(params[:id])

# Find the current user (i.e. customer's) homes (to allow them to choose which should be cleaned)
    @homes = Home.find(current_user.id)
    @appointments = Appointment.where(:home_id => @homes_id).order(date: :asc)
  end

  def is_authorised
    redirect_to user_path, alert: "You don't have permission to access this." unless current_user.id == @availability.user_id
  end

end
