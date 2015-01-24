class UsersController < ApplicationController
  before_action :correct_user,   only: [:update, :destroy]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @user_reviews = @user.reviews
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Third Wave"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  #Before Filters

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end