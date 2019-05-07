class ChecklistTemplates::UsersController < ApplicationController
  def show
    @checklist_templates = ChecklistTemplate.where(user: current_user)
  end
end
