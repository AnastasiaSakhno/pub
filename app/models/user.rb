class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache, :remove_avatar
  # attr_accessible :title, :body
  before_create :create_role

  has_many :users_roles
  has_many :roles, :through => :users_roles

  private

  def create_role
    self.roles << Role.find_by_name(:user)
  end
end
