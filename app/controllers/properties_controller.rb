class PropertiesController < ApplicationController
  include SessionsHelper

  def index
    @properties = Property.all
  end

  def my_properties
    @properties = Property.where(user_id: current_user.id)
    render 'index'
  end

  def new
    if !logged_in?
      redirect_to 'login'
    end

    @property = Property.new()
    @property_types = Property.property_types
  end

  def create
    if !logged_in?
      redirect_to 'login'
    end

    property = Property.new(property_params)
    property.user_id = current_user.id

    if property.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
    @property_types = Property.property_types
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    redirect_to '/'
  end

  def update
    @property = Property.find(params[:id])

    byebug
    
    if @property.update(property_params)
      redirect_to property_url
    else
      redirect_to '/'
    end
  end

  private

  def property_params()
    permitted_fields = [:price, :name, :property_type, :address, :city, :state, :country, :capacity, :image, :booking_id, :user_id]
    params.require(:property).permit(permitted_fields)
  end

end
