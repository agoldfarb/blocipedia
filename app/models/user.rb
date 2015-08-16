class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :collaborators
  has_many :wikis, through: :collaborators
  
  after_initialize :set_default_role

  validates :role, presence: true, inclusion: { in: %w(standard premium admin), message: "should be one of admin, premium, standard" }

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

  def upgrade_account(user)
    user.role = 'premium'
    user.save
  end
  
  def downgrade_account(user)
    user.role = 'standard'
    user.save
    user.wikis.where(private: true).update_all(private: false)
  end

  def is_owner_of?(wiki)
    admin? || wiki.users.include?(self) || wiki.new_record?
  end
end