class ChecklistTemplateDecorator < Draper::Decorator
  delegate_all

  def show_tags
    tag_list.join(', ')
  end
end
