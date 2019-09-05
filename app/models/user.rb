class User < ApplicationRecord
  #mount_uploader :image_url, AvatarUploader
  include Gravtastic
  gravtastic 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end
