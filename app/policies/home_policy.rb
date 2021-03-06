class HomePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    user.admin? || record.try(:user) == user
  end

  def destroy?
    user.admin? || record.try(:user) == user
  end
end
