class UsersController < ApplicationController    
    def new
        @user = User.new
        @user.profile.build
      end

    def update
      binding.pry
    end

    def show
        @user = User.find(params[:id])
    end
    private
    
    def user_params
        params.require(:user).permit(profile_attributes: [:bio, :avatar, :sex])
    end
end