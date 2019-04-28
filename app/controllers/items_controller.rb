class ItemsController < ApplicationController
  before_action :find_checklist, only: %i[create update destroy]
  before_action :find_item, only: %i[create update destroy]

  def create
    @item = @checklist.items.build
    if @item.save
      redirect_to checklist_path(@checklist), notice: 'Successfully created!'
    else
      redirect_to checklist_path(@checklist), alert: 'Something went wrong'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to checklist_path(@checklist), notice: 'Successfully updated!'
    else
      redirect_to checklist_path(@checklist), alert: 'Something went wrong'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to checklist_path(@checklist), notice: 'Successfully deleted!'
    else
      redirect_to checklist_path(@checklist), alert: 'Something went wrong'
    end
  end

  private

  def find_checklist
    @checklist = Checklist.find(params[:checklist_id])
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :done)
  end
end
