class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      flash[:success] = t "success"
      log_in user
      redirect_to user
    else
      flash.now[:danger] = t "invalid"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
