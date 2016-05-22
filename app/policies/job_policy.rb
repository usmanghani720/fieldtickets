class JobPolicy < ApplicationPolicy
  def all?
    user.manager?
  end
  
  def index?
    user.manager?
  end
end
