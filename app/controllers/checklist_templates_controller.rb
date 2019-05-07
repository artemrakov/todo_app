class ChecklistTemplatesController < ApplicationController
  before_action :find_checklist_template, only: %i[show create_checklist]

  def index
    @checklist_templates = ChecklistTemplate.all
  end

  def new
    @checklist_template = ChecklistTemplate.new
  end

  def create
    @checklist_template = ChecklistTemplate.new(checklist_template_params)
    if @checklist_template.save
      redirect_to checklist_template_path(@checklist_template), notice: t('checklist_template.success_create')
    else
      redirect_to checklist_templates_path, alert: t('checklist_template.fail_create')
    end
  end

  def show
    @template_items = @checklist_template.template_items
  end

  private

  def find_checklist_template
    @checklist_template = ChecklistTemplate.find(params[:id]).decorate
  end

  def checklist_template_params
    params.require(:checklist_template).permit(:title, :tag_list)
  end
end
