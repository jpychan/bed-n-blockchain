class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      session[:user_id] = user.id
      redirect_to '/'
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    # log_out
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_url
  end
end
