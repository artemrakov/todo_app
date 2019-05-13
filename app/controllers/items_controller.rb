class ItemsController < ApplicationController
  before_action :find_checklist, only: %i[new create]
  before_action :find_item, only: %i[update destroy]

  def new
    @item = Item.new
  end

  def create
    item_form = ItemCreationWizard.new(item_params, @checklist)

    if item_form.save
      redirect_to checklist_path(item_form.checklist), notice: t('item.success_create')
    else
      redirect_to checklist_path(item_form.checklist), alert: t('item.fail_create')
    end
  end

  def update
    if @item.update(item_params)
      redirect_to checklist_path(@item.checklist), notice: t('item.success_update')
    else
      redirect_to checklist_path(@item.checklist), alert: t('item.fail_update')
    end
  end

  def destroy
    if @item.destroy
      redirect_to checklist_path(@item.checklist), notice: t('item.success_destroy')
    else
      redirect_to checklist_path(@item.checklist), alert: t('item.fail_destroy')
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
    params.require(:item).permit(:title)
  end
end
