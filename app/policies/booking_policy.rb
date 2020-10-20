class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    user.admin? || record.try(:user) == user
  end

  def update?
    show?
  end

  def destroy?
    user.admin?
  end
end
