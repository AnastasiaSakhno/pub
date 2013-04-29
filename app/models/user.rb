class User < ActiveRecord::Base
  rolify
  has_many :sales
  after_create :init
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache, :remove_avatar, :roles, :name, :middle_name, :last_name

  validates :name, :presence => true
  validates :middle_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true,
            :uniqueness => true,
            :length => {:minimum => 5, :maximum => 100},
            :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  private

  def init
    self.roles << Role.find_by_name(:user)
    UserMailer.welcome(self, I18n.locale).deliver
  end

  public

  def self.employee? user
    user.roles.include? Role.find_by_name(:employee)
  end
end
