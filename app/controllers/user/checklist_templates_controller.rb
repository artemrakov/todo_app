class User::ChecklistTemplatesController < ApplicationController
  def index
    @checklist_templates = current_user.checklist_templates
  end
end
