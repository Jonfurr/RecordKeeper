class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      session[:current_user_id] = @user.id


      redirect_back_or_to(:albums, notice: 'Login successful')

    else
      redirect_back_or_to('welcome')
      flash[:error] = "Your login failed. Please try again or create an account!"
    end
  end

  def destroy
    logout
    redirect_to(:albums, notice: 'Logged out!')
  end
end