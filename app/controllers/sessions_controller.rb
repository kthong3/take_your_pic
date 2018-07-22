class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to root_url, notice: 'welcome!'
    else
      flash.now.alert = 'email or password is invalid.'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url, notice: 'you have successfully logged out.'
  end
end
