class ChecklistsController < ApplicationController
  before_action :find_checklist, only: %i[show update destroy]

  def index
    @checklists = Checklist.all
  end

  def show
  end

# Commented out as you can only create checklist from checklist template
  # def create
  #   @checklist = current_user.checklists.build(checklist_params)
  #   if @checklist.save
  #     redirect_to checklist_path(@checklist), notice: t('checklist.success_create')
  #   else
  #     redirect_to checklists_path, alert: t('checklist.fail_create')
  #   end
  # end

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
end
