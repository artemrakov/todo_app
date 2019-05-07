class ChecklistTemplates::SearchesController < ApplicationController
  def show
    @checklist_templates = ChecklistTemplate.search(params[:search], where: { private: false })
  end
end
