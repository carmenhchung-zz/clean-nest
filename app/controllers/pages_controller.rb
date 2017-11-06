# This controller sets out the search functionality

class PagesController < ApplicationController
  def search
      # First, check that the user has provided a location. Use a session variable (loc_search) to remember the location the user searched for so they don't need to enter it again.
      if params[:search].present? && params[:search].strip != ""
        session[:loc_search] = params[:search]
      end

      # Second, their session location search is known and it is not empty, search for all the active users (i.e. those who have clicked that they are cleaners on their profile page) within 10 km the location they have entered
      if session[:loc_search] && session[:loc_search] != ""
        @user_location = User.where(active: true).near(session[:loc_search], 20, order: 'distance')
        @filtered_availabilities = Availability.where(date: params[:date])

        @user_array = []
        @filtered_availabilities.each do |availability|
          @user_array << availability.user_id
        end
        if params[:price] != nil
          @filtered_users = User.where("id = ?", @user_array)
        else
            @filtered_users = User.where("id = ?", @user_array)
        end
      else
        # If they did not provide a location and/or date, then pull up all the cleaners.
        @user_location = User.where(active: true).all
      end

      # Third, once we know all the cleaners within 10 km of the customer, we search those cleaners for those that fulfill the price criteria (params 'q' comes from ransack).
      @search = @user_location.ransack(params[:q])

      # Once the search results are obtained, make it into an array so it can be later displayed in the views.
      @users = @search.result
      @arrUsers = @filtered_users.to_a

      # Search the results to see which cleaners are actually available on the date requested.
      # if (params[:date] && !params[:date].empty?)
      #
      #   date = User.parse(params[:date])

        # @users.each do |user|

          # available = user.availability.where(
          #   user.availability.start_time [date] == params[:date]
          # ).limit(1)

          # if available.length < 0
          #     @arrUsers.delete(user)
          # end

          # Note: insert the code from the availability checking function on the user form [i.e. profile availability]

        # end
      # end

    end

end
