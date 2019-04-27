class ItemsController < ApplicationController

  def create
    checklist = Checklist.find(params[:checklist_id])
    item = Item.new(checklist: checklist)
    if item.save
      redirect_to checklist_path(checklist), notice: 'Successfully created!'
    else
      redirect_to checklist_path(checklist), alert: 'Something went wrong'
    end
  end

  def update
    item = Item.find(params[:id])
    checklist = Checklist.find(params[:checklist_id])
    if item.update(item_params)
      redirect_to checklist_path(checklist), notice: 'Successfully updated!'
    else
      redirect_to checklist_path(checklist), alert: 'Something went wrong'
    end
  end

  def destroy
    item = Item.find(params[:id])
    checklist = Checklist.find(params[:checklist_id])
    if item.destroy
      redirect_to checklist_path(checklist), notice: 'Successfully deleted!'
    else
      redirect_to checklist_path(checklist), alert: 'Something went wrong'
    end
  end


  private

  def item_params
    params.require(:item).permit(:title, :done)
  end
end

