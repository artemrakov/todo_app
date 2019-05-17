class ChecklistsController < ApplicationController
  before_action :find_checklist, only: %i[show update destroy]
  before_action :find_checklist_template, only: :create

  def index
    @checklists = current_user.checklists.paginate(page: params[:page])
  end

  def show
  end

  def create
    @checklist_form = ChecklistForm.new(
      user: current_user,
      checklist_template: @checklist_template,
      title: @checklist_template.title
    )
    if @checklist_form.save
      redirect_to checklist_path(@checklist_form.checklist)
    else
      redirect_to checklist_templates_path(@checklist_template)
    end
  end

  def update
    if @checklist.update(checklist_params)
      redirect_to checklist_path(@checklist), notice: t('checklist.success_update')
    else
      redirect_to checklist_path(@checklist), alert: t('checklist.fail_update')
    end
  end

  def destroy
    if @checklist.destroy
      redirect_to checklists_path, notice: t('checklist.success_destroy')
    else
      redirect_to checklist_path(@checklist), alert: t('checklist.fail_destroy')
    end
  end

  private

  def find_checklist_template
    @checklist_template = ChecklistTemplate.find(params[:checklist_template_id])
  end

  def find_checklist
    @checklist = Checklist.find(params[:id])
  end

  def checklist_params
    params.require(:checklist).permit(:title)
  end
end
