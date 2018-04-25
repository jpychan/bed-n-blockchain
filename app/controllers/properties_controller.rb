class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    redirect_to '/'
  end

  def update
    @property = Property.find(params[:id])
    permitted_fields = property_params(params)

    if @property.update(permitted_fields)
      redirect_to property_url
    else
      redirect_to :back
    end
  end

  private

  def property_params(params)
    permitted_fields = [:price, :name, :type, :location,:capacity, :image_url]
    params.require(:property).permit(permitted_fields)
  end

end
