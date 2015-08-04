class WikiPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.private != true || (user.present? && ((user.role == 'admin') || record.user == user || record.user.include?(user)))
  end
end