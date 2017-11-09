class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :home

#   def self.save_appointment(params, user, cleaner)
#   @params = params["appointment"]
#   @appointment = Appointment.new
#   @appointment.user = cleaner
#   @appointment.home = user.homes.first
#   @appointment.date = @params["date"]
#   # @appointment.start_time = @params["start_time"]
#   # @appointment.end_time = @params["end_time"]
#   @appointment.save
# end
end
