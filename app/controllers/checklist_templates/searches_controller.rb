class ChecklistTemplates::SearchesController < ApplicationController
  def show
    @checklist_templates = ChecklistTemplate.search(params[:search])
  end
end
