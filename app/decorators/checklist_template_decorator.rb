class ChecklistTemplateDecorator < Draper::Decorator
  delegate_all

  def tag_show
    tag_list.join(', ')
  end
end
