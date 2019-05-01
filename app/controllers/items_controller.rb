class ItemsController < ApplicationController
  before_action :find_checklist, only: %i[create update destroy]
  before_action :find_item, only: %i[update destroy]

  # TODO: add belongs_to template_item optional
  # def create
  #   @item = @checklist.items.build(item_params)
  #   if @item.save
  #     redirect_to checklist_path(@checklist), notice: t('item.success_create')
  #   else
  #     redirect_to checklist_path(@checklist), alert: t('item.fail_create')
  #   end
  # end

  def update
    if @item.update(item_params)
      redirect_to checklist_path(@checklist), notice: t('item.success_update')
    else
      redirect_to checklist_path(@checklist), alert: t('item.fail_update')
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to checklist_path(@checklist), notice: t('item.success_destroy')
    else
      redirect_to checklist_path(@checklist), alert: t('item.fail_destroy')
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
