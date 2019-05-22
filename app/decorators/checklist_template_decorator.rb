class ChecklistTemplateDecorator < Draper::Decorator
  delegate_all

  def show_tags
    tag_list.join(', ')
  end

  def states
    aasm.states.map(&:name).map(&:to_s)
  end
end
