class ChecklistsController < ApplicationController

  def index
    @checklists = Checklist.all
  end

  def show
    @checklist = Checklist.find(params[:id])
  end

  def create
    checklist = Checklist.new(user: current_user)
    if checklist.save
      redirect_to checklist_path(checklist), notice: 'Successfully created!'
    else
      redirect_to :index, alert: 'Something went wrong. Checklist can not be created'
    end
  end

  def update
    @checklist = Checklist.find(params[:id])
    if @checklist.update(checklist_params)
      redirect_to checklist_path(@checklist), notice: 'Successfully changed!'
    else
      redirect_to checklist_path(@checklist), alert: 'Something went wrong'
    end
  end

  def destroy
    @checklist = Checklist.find(params[:id])
    if @checklist.destroy
      redirect_to checklists_path, notice: 'Successfully deleted!'
    else
      redirect_to checklist_path(@checklist), alert: 'Something went wrong'
    end
  end


  private

  def checklist_params
    params.require(:checklist).permit(:title)
  end

end
