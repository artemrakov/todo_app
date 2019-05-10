# Controller that handles the state of Item
class ItemStatesController < ApplicationController
  before_action :find_item, only: %i[create destroy]

  def create
    @item.complete!
    redirect_to checklist_path(@item.checklist), alert: t('item.success_update')
  end

  def destroy
    @item.undo!
    redirect_to checklist_path(@item.checklist), alert: t('item.success_update')
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end
end
