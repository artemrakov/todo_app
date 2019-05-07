class ChecklistsController < ApplicationController
  before_action :find_checklist, only: %i[show update destroy]

  def index
    @checklists = Checklist.all
  end

  def show
  end

  def new
    @checklist = Checklist.new
  end

  def create
    checklist_template = ChecklistTemplateCreator.new(
      checklist: checklist_params, checklist_template: checklist_template_params
    )
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

  def find_checklist
    @checklist = Checklist.find(params[:id])
  end

  def checklist_params
    params.require(:checklist).permit(:title)
  end

  def checklist_template_params
    params.require(:checklist_template).permit(:one_time, :private)
  end
end
