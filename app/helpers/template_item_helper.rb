module TemplateItemHelper
  def delete_template_link(checklist_template, template_item)
    return unless policy(template_item).destroy?

    link_to t('views.checklist_templates.delete.title'),
            checklist_template_template_item_path(checklist_template, template_item),
            method: :delete, data: { confirm: t('confirmation') }
  end
end
