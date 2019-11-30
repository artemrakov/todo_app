# coping checklist template and template items
# and creating checklist with same items
class ChecklistCopiesController < ApplicationController
  def create
    @checklist_template = find_checklist_template
    authorize @checklist_template
    service = ChecklistCopiesService.new(current_user, @checklist_template)
    service.run
    redirect_to checklist_path(service.checklist)
  end

  private

  def find_checklist_template
    @checklist_template = ChecklistTemplate.find(params[:checklist_template_id])
  end
end
