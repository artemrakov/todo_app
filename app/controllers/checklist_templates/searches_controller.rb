class ChecklistTemplates::SearchesController < ApplicationController
  def show
    @checklist_templates = ChecklistTemplates.search(params[:search])
  end
end
