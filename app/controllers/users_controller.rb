class UsersController < ApplicationController
  before_action :ensure_logged_in, only: [:index, :show]
  before_action :ensure_logged_out, only: [:new, :create]

  def index
    @users = User.all
    # render json: users
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    @user.location_id = Location.first.id
    if @user.save
      # once we have user we will make sure to login the user weve made
      login(@user)
      redirect_to user_url(@user)
    else
      # render json: @user.errors.full_messages, status: 422
      # flash[:errors] = @user.errors.full_messages 
      flash.now[:errors] = @user.errors.full_messages 
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :age, :fav_language, :password)
  end
end
