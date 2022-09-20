class UsersController < ApplicationController
  before_action :require_logged_out, only: [:create, :new] 

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      # render :show
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user.email
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
