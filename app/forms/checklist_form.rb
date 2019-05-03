# creates checklist from checklist template
# copies template items from checklist template to items from checklist
class ChecklistForm
  include ActiveModel::Model

  attr_accessor :title
  attr_accessor :user
  attr_accessor :checklist_template
  attr_accessor :checklist

  validates :title, presence: true, length: { maximum: 100 }

  def initialize(attributes)
    super(attributes)
    @checklist = Checklist.new(title: title, user: user, checklist_template: checklist_template)
  end

  def save
    return false unless valid?

    create_items
    checklist.save!
  end

  def create_items
    checklist_template.template_items.each do |template_item|
      checklist.items.build(template_item: template_item, title: template_item.title)
    end
  end
end
