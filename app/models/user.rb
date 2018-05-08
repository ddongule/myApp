class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_secure_password
  # encrypted_password
  # validates_confirmation_of :name, :email, :password
  # validates_confirmation_of :email, :message => "should match confirmation"

end
