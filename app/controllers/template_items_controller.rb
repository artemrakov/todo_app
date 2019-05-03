class TemplateItemsController < ApplicationController
  before_action :find_checklist_template, only: %i[create]
  before_action :find_template_item, only: %i[update destroy]

  def create
    @template_item = @checklist_template.template_items.build(template_item_params)
    if @template_item.save
      redirect_to checklist_template_path(@checklist_template), notice: t('template_item.success_create')
    else
      redirect_to checklist_template_path(@checklist_template), alert: t('template_item.fail_create')
    end
  end

  def update
    if @template_item.update(template_item_params)
      redirect_to checklist_template_path(@template_item.checklist_template), notice: t('template_item.success_update')
    else
      redirect_to checklist_template_path(@template_item.checklist_template), alert: t('template_item.fail_update')
    end
  end

  def destroy
    if @template_item.destroy
      redirect_to checklist_template_path(@template_item.checklist_template), notice: t('template_item.success_destroy')
    else
      redirect_to checklist_template_path(@template_item.checklist_template), alert: t('template_item.fail_destroy')
    end
  end

  private

  def find_checklist_template
    @checklist_template = ChecklistTemplate.find(params[:checklist_template_id])
  end

  def find_template_item
    @template_item = TemplateItem.find(params[:id])
  end

  def template_item_params
    params.require(:template_item).permit(:title, :description)
  end
end
