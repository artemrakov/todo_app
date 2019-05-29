class ChecklistTemplatesController < ApplicationController
  before_action :find_checklist_template, only: %i[show]

  def index
    @checklist_templates = ChecklistTemplate.everyone.paginate(page: params[:page])

    keyword = params[:search]
    @checklist_templates = @checklist_templates.search(keyword) if keyword.present?
  end

  def new
    @checklist_template = ChecklistTemplate.new
    authorize @checklist_template
  end

  def create
    @checklist_template = current_user.checklist_templates.build(checklist_template_params)
    authorize @checklist_template
    if @checklist_template.save
      redirect_to checklist_template_path(@checklist_template), notice: t('checklist_template.success_create')
    else
      redirect_to checklist_templates_path, alert: t('checklist_template.fail_create')
    end
  end

  def show
    authorize @checklist_template
    @template_items = @checklist_template.template_items
    @template_item = TemplateItem.new(checklist_template: @checklist_template)
  end

  private

  def find_checklist_template
    @checklist_template = ChecklistTemplate.find(params[:id]).decorate
  end

  def checklist_template_params
    params.require(:checklist_template).permit(:title, :tag_list, :visibility)
  end
end
