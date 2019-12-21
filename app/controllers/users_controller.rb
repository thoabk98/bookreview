class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update, :show, :edit]
  before_action :check_permission, only: %w[update, edit]
  def new
      @user = User.new
      @user.profile.build
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path @user
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong ..."
    end
  end

  def edit
    @user.profile = Profile.new if @user.profile.nil?
  end

  private
  def user_params
    params.require(:user)
          .permit(:email, :username, :current_password,
                  :password, :password_confirmation,
                  profile_attributes: [:bio, :avatar, :sex])
  end

  def set_user
    @user = User.find(params[:id])
    raise ActionController::RoutingError.new('Not Found') unless @user.present?
  end

  def check_permission
    if current_user != @user
      flash[:alert] = "You don't have permision"
      redirect_to root_path
    end
  end
end
