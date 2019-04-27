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
      redirect_to checklist_path(checklist)
    else
      redirect_to :index
    end
  end

end
