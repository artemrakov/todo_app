class ChecklistForm
  include ActiveModel::Model

  attr_accessor(
    :title,
    :user,
    :checklist_template,
    :checklist
  )

  def initialize(attributes)
    super(attributes)
    @checklist = Checklist.new(title: title, user: user, checklist_template: checklist_template)
  end

  def save
    return false unless valid?

    create_items
    checklist.save
  end

  def create_items
    checklist_template.template_items.each do |template_item|
      checklist.items.build(template_item: template_item)
    end
  end
end
