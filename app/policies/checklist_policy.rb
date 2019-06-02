class ChecklistPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    owner?
  end

  def show?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    record.user == user
  end
end
