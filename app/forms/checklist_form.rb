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

    @checklist = Checklist.new(title: title, user: user, checklist_template: checklist_template)
    create_items
    @checklist.save
  end

  def create_items
    checklist_template.template_items.each do |template_item|
      @checklist.items.build(template_item: template_item)
    end
  end
end
