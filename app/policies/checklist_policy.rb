class ChecklistPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    record.user == user
  end

  def show?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
