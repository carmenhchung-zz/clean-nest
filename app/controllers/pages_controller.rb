# This controller sets out the search functionality
# require 'Date'
# require 'Time'

class PagesController < ApplicationController
  def search
      # First, check that the user has provided an address. Use a session variable (loc_address) to remember the address the user searched for so they don't need to enter it again.
      if params[:address].present? && params[:address].strip != ""
        session[:loc_address] = params[:address]
      end

      # Second, if their session address is known and it is not empty, search for all the active users (i.e. those who have clicked that they are cleaners on their profile page) within 20 km from the location they have entered.
      if session[:loc_address] && session[:loc_address] != ""
        @user_location = User.where(active: true).near(session[:loc_address], 20, order: 'distance')

      # If they did not provide a location and/or date, then show all the cleaners.
      else
        @user_location = User.where(active: true).all
      end

      # Third, once we know all the cleaners within 20 km of the customer, we search those cleaners for those that fulfill any additional criteria (params 'q' comes from ransack).
      @search = @user_location.ransack(params[:q])

      # Once the search results are obtained, make it into an array so it can be later displayed in the views.
      @users = @search.result
      @arrUsers = @users.to_a

      # Search the results (those within 20 km from search location) to see which cleaners are actually available on the date requested.
      if (params[:date] && !params[:date].empty?)
          search_date = Date.parse(Time.parse(params[:date]).strftime("%Y-%m-%d"))

        @arrUsers.each do |user|
          user_availabilities = Availability.where(date: search_date)
          @arrUsers.delete(user)
          end
        end
      end
end
