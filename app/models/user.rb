class User < ActiveRecord::Base
  after_initialize :set_default_role

  def set_default_role
    self.role ||= :standard
  end

  def admin?
    role == 'admin'
  end

  def standard?
    role == 'standard'
  end

  def premium?
    role == 'premium'
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
