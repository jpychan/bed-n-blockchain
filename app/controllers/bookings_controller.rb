class BookingsController < ApplicationController
  include SessionsHelper
  include PropertiesHelper

  def index
    if Property.find(params[:property_id]) && is_owner?(current_user.id)
      @bookings = Property.find(params[:property_id]).bookings
    else
    end
  end

  def my_bookings
    if logged_in?
      @bookings = Booking.where(user_id: current_user.id)
    else
      redirect_to 'login'
    end
  end

  def dates
    @bookings = Property.find(params[:property_id]).bookings

    @dates = [];
    @bookings.each do |booking|
      @dates.concat((booking.start_date..booking.end_date).to_a)
    end

    render json: @dates
  end

  def create

    if !logged_in?
      redirect_to '/login'
    end

    if !is_owner?(params[:property_id])
      booking = Booking.new(booking_params)
      booking.start_date = Date.strptime(booking_params[:start_date], '%m-%d-%Y')
      booking.end_date = Date.strptime(booking_params[:end_date], '%m-%d-%Y')
      booking.user_id = current_user.id
      booking.property_id = params[:property_id]
      booking.status = 1
      
      if booking.save()
        redirect_to '/dashboard/my_bookings'
      end
    else
    end
  end

  def thank_you
  end

  def update
    booking = Booking.find(params[:id])
    is_owner = is_owner?(params[:property_id])
    is_booked_user  = current_user.id == booking.user_id
    
    if (is_owner ||  is_booked_user)
      booking.update(booking_params)
    end
    if is_owner
      redirect_to '/dashboard/my_properties'
    elsif is_booked_user
      redirect_to '/dashboard/my_bookings'
    end
  end

  private
  def booking_params
    params.require(:booking).permit([:property_id, :user_id, :start_date, :end_date, :status])
  end

end