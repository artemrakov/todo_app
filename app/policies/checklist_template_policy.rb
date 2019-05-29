class ChecklistTemplatePolicy < ApplicationPolicy
  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end
end
