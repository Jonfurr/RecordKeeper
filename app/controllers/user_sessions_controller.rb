class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      session[:current_user_id] = @user.id
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login Failed. Please create an account!'
      redirect_back_or_to('login', notice: 'Your login failed!')
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end