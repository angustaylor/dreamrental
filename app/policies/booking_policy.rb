class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
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
    user.admin? || record.try(:user) == user
  end
end
