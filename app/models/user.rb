class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :rememberable,
  # :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  attr_accessible :facebook_uid
  # attr_accessible :title, :body, :remember_me

  has_many :messages, :dependent => :destroy


  def name
    "User #{self.id}"
  end
end
