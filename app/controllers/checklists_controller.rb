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

end
