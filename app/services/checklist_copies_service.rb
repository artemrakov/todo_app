# creates checklist from checklist template
# copies template items from checklist template to items from checklist
class ChecklistCopiesService
  include ActiveModel::Model

  attr_reader :user, :checklist_template, :checklist

  def initialize(user, checklist_template)
    @user = user
    @checklist_template = checklist_template
    @checklist = Checklist.new(title: checklist_template.title, user: user, checklist_template: checklist_template)
  end

  def run
    create_items
    checklist.save!
  end

  private

  def create_items
    checklist_template.template_items.each do |template_item|
      checklist.items.build(template_item: template_item, title: template_item.title, type: 'InheritedItem')
    end
  end
end
