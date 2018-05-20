module PropertiesHelper
  include SessionsHelper

  def is_owner?(id)
    if current_user == Property.find(id).user
      return true
    else
      return false
    end
  end
end
