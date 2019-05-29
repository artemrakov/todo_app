class ChecklistsController < ApplicationController
  before_action :find_checklist, only: %i[show update destroy]

  def index
    @checklists = current_user.checklists.paginate(page: params[:page])
  end

  def show
    authorize @checklist
  end

  def new
    @checklist_template = ChecklistTemplate.new.decorate
    @checklist = Checklist.new
    authorize @checklist
  end

  def create
    checklist_form = ChecklistCreationService.new(checklist_template_params, current_user)
    authorize checklist_form.checklist
    if checklist_form.save
      redirect_to checklist_path(checklist_form.checklist), notice: t('checklist.success_create')
    else
      redirect_to new_checklist_path, notice: t('checklist.fail_create')
    end
  end

  def update
    authorize @checklist
    if @checklist.update(checklist_params)
      redirect_to checklist_path(@checklist), notice: t('checklist.success_update')
    else
      redirect_to checklist_path(@checklist), alert: t('checklist.fail_update')
    end
  end

  def destroy
    authorize @checklist
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

  def checklist_template_params
    params.require(:checklist_template).permit(:title, :visibility, checklist: [:title])
  end
end
