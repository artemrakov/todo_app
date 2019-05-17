class ChecklistTemplates::UsersController < ApplicationController
  def show
    @checklist_templates = current_user.checklist_templates
  end
end
