class SessionsController < ApplicationController
  def create
    set_current_user(params[:user_type])

    redirect_back fallback_location: '/', notice: "Welcome #{current_user.name}"
  end

  def destroy
    session[:user] = nil
    redirect_back fallback_location: '/', notice: 'See you again !'
  end
end
