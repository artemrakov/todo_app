# coping checklist template and template items
# and creating checklist with same items
class ChecklistCopiesController < ApplicationController
  before_action :find_checklist_template

  def create
    @checklist_form = ChecklistForm.new(user: current_user,
                                        checklist_template: @checklist_template,
                                        title: @checklist_template.title)
    authorize @checklist_form.checklist
    if @checklist_form.save
      redirect_to checklist_path(@checklist_form.checklist)
    else
      redirect_to checklist_templates_path(@checklist_template)
    end
  end

  private

  def find_checklist_template
    @checklist_template = ChecklistTemplate.find(params[:checklist_template_id])
  end
end
