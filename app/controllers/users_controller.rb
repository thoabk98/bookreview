class UsersController < ApplicationController
  before_action :set_user, only: [:update, :show, :edit]

  def new
      @user = User.new
      @user.profile.build
  end

  def update
    if @user.update user_params
      redirect_to edit_user_path @user
      # them flash alert bao thanh cong
    else
      # xu li fail, them flash alert
    end
  end

  def show
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
end
