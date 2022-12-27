class SessionsController < ApplicationController

  def new
    @user = User.find_by(mail: params[:mail])
  end

  def create
    @user = User.find_by(mail: params[:mail])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    if session[:user_id]
      session.delete(:user_id)
      flash[:alert] = 'You have logged out!'
    end
    redirect_to login_path
  end

end
