class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  default_scope { order('created_at DESC') }

  def public?
    !self.private
  end

  def make_public
    self.update_attribute(public: true)
  end
end
