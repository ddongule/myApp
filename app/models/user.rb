class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  rolify
  include Authority::UserAbilities

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  # belongs_to :team
  # 전에 코드에서 가져옴

  # has_secure_password
  # encrypted_password
  # validates_confirmation_of :name, :email, :password
  # validates_confirmation_of :email, :message => "should match confirmation"


    after_create :set_default_role, if: Proc.new { User.count > 1 }

    private

    def set_default_role
      add_role :user
    end

end
