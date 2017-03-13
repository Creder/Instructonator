class User < ApplicationRecord
  rolify
  acts_as_voter
  has_many :posts
  has_many :steps
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :vkontakte, :twitter]
         
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.add_role "member"
      user.password = Devise.friendly_token[0,20]

    end      
  end

end
