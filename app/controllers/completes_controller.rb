# Completes item inside checklist
class CompletesController < ApplicationController
  before_action :find_item, only: :create

  def create
    @item.complete!
    redirect_to checklist_path(@item.checklist), alert: t('item.success_update')
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end
end
