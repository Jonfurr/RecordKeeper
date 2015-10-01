class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
   @user = User.find(params[:id])
   @albums= Album.where(user_id: params[:id])
   # @album = Album.joins('LEFT OUTER JOIN users ON albums.user_id = users.id').find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
     unless session[:current_user_id] === @user.id
      flash[:alert] = "You don't have access to that User!"
      redirect_to users_path(session[:current_user_id])
      return
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.pic_url
    @user.pic_url = "/assets/default.png" if @user.pic_url.empty?

    respond_to do |format|
      if @user.save
          auto_login(@user)
          format.html { redirect_to(:users, :notice => 'Registration successfull.') }
          format.json { render :show, status: :created, location: @user }
          
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end  
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :name, :pic_url, :password, :password_confirmation, :session)
    end
end

