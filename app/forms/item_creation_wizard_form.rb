# It creates item and template item if user is owner of checklist template
class ItemCreationWizardForm
  include ActiveModel::Model

  attr_accessor :title
  attr_accessor :item
  attr_accessor :checklist

  validates :title, presence: true, length: { maximum: 100 }

  def initialize(item_params, checklist)
    @title = item_params[:title]
    @checklist = checklist
    @item = @checklist.items.build(item_params)
  end

  def save
    return false unless valid?

    create_template_item if owner_of_template?
    item.save!
  end

  private

  def create_template_item
    checklist_template.template_items.create!(title: title)
  end

  def checklist_template
    checklist.checklist_template
  end

  def owner_of_template?
    checklist_template.user == checklist.user
  end
end
