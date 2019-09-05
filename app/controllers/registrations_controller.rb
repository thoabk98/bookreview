class RegistrationsController < Devise::RegistrationsController

    private
  
    def sign_up_params
      params.require(:user).permit(:name,:image_url, :email, :password, :password_confirmation)
    end
  
   
  end