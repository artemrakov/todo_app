# When user want to create checklist throw checklist_controller
# it creates checklist template and checklist
class ChecklistCreationWizard
  include ActiveModel::Validations

  attr_reader :checklist_template
  attr_reader :user
  attr_accessor :title
  attr_reader :checklist

  validates :title, presence: true, length: { maximum: 100 }
  validates :user, presence: true
  validates :checklist, presence: true
  validates :checklist_templates, presence: true

  def initialize(checklist_params, checklist_template_params, user)
    all_params = checklist_params.merge(checklist_template_params)
    @user = user
    @title = checklist_params[:title]
    @checklist_template = user.checklist_templates.build(all_params)
    @checklist = user.checklists.build(checklist_template: @checklist_template, title: @title)
  end

  def save
    return false unless valid?

    checklist_template.save!
    checklist.save!
  end
end
