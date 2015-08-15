class Wiki < ActiveRecord::Base
  belongs_to :user


  def public?
    !self.private
  end

  def make_public
    self.update_attribute(public: false)
  end
end
