class ItemPolicy < ApplicationPolicy
  def create?
    checklist_owner?
  end

  def update?
    checklist_owner?
  end

  def destroy?
    checklist_owner?
  end

  private

  def checklist_owner?
    record.checklist.user == user
  end
end
