class ChecklistsController < ApplicationController
  before_action :find_checklist, only: %i[show update destroy]

  def index
    @checklists = Checklist.all
  end

  def show
  end

  def create
    @checklist = current_user.checklists.build
    if @checklist.save
      redirect_to checklist_path(@checklist), notice: 'Successfully created!'
    else
      redirect_to :index, alert: 'Something went wrong. Checklist can not be created'
    end
  end

  def update
    if @checklist.update(checklist_params)
      redirect_to checklist_path(@checklist), notice: 'Successfully changed!'
    else
      redirect_to checklist_path(@checklist), alert: 'Something went wrong'
    end
  end

  def destroy
    if @checklist.destroy
      redirect_to checklists_path, notice: 'Successfully deleted!'
    else
      redirect_to checklist_path(@checklist), alert: 'Something went wrong'
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
