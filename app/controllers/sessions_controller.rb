class SessionsController < ApplicationController
  before_action :ensure_logged_in, only: [:destroy]
  before_action :ensure_logged_out, only: [:new, :create]
  
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password]) #find the user using username & password by calling class method find_by_credentials
    if @user #if the user exists
      login(@user)
      redirect_to user_url(@user) #rails magic! if we pass full @user it will grab id for us == @user.id
    else
      flash.now[:errors] = ['Invalid Credentials']
      render :new
    end
  end

  def destroy
    logout!
    # render :new
    flash[:success] = ["Successfully logged out"]
    redirect_to new_session_url
  end
end
