class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:foursquare]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me,
  				  :provider, :uid


  has_many :trips
  before_create :create_name

  def create_name            
    email = self.email.split(/@/)
    login_taken = User.where( :name => email[0]).first
    unless login_taken
      self.name = email[0]
    else  
      self.name = 'user' + Digest::MD5::hexdigest(self.email).downcase
    end        
  end
end
