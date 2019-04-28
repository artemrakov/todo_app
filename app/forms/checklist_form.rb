class ChecklistForm
  include ActiveModel::Model

  attr_accessor(
    :title,
    :user,
    :checklist_template,
    :checklist
  )

  def save
    return false unless valid?

    @checklist = Checklist.create(title: title, user: user, checklist_template: checklist_template)
    @checklist.items = items
    @checklist.save
  end

  def items
    items = []
    checklist_template.template_items.each do |template_item|
      items << Item.create(template_item: template_item, checklist: @checklist)
    end
    items
  end
end
