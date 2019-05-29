class CustomItemPolicy < ApplicationPolicy
  def create?
    ItemPolicy.new(user, record).create?
  end

  def update?
    ItemPolicy.new(user, record).update?
  end

  def destroy?
    ItemPolicy.new(user, record).destroy?
  end
end
