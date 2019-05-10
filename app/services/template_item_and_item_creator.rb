class TemplateItemAndItemCreator
  include ActiveModel::Model

  def intialize(item_params, user, checklist_template)
    user.checklists.build(checklist_template: checklist_template, title: item)
  end
end
