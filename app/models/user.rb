class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments
  accepts_nested_attributes_for :profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
      
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        username:  auth.info.name,
        password: Devise.friendly_token[0, 20],
        image:  auth.info.image
      )
    end
      
    user
  end
end
