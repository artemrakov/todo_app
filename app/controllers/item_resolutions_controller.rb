class ItemResolutionsController < ApplicationController
  def create
    authorize item, :update?
    item.complete!
    redirect_to checklist_path(@item.checklist), alert: t('item.success_update')
  end

  def destroy
    authorize item, :update?
    item.undo!
    redirect_to checklist_path(@item.checklist), alert: t('item.success_update')
  end

  private

  def item
    @item ||= Item.find(params[:item_id])
  end
end
