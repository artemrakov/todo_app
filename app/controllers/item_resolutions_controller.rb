class ItemResolutionsController < ApplicationController
  def create
    find_item
    @item.complete!
    redirect_to checklist_path(@item.checklist), alert: t('item.success_update')
  end

  def destroy
    find_item
    @item.undo!
    redirect_to checklist_path(@item.checklist), alert: t('item.success_update')
  end

  def find_item
    @item ||= Item.find(params[:item_id])
  end
end
