class TemplateItemPolicy < ApplicationPolicy
  def create?
    owner_of_checklist_template?
  end

  def update?
    owner_of_checklist_template?
  end

  def destroy?
    owner_of_checklist_template?
  end

  def owner_of_checklist_template?
    record.checklist_template.user == user
  end
end
