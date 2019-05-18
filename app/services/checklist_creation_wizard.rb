# When user want to create checklist throw checklist_controller
# it creates checklist template and checklist
class ChecklistCreationWizard
  include ActiveModel::Model

  attr_reader :checklist_template
  attr_reader :user
  attr_accessor :title
  attr_reader :checklist

  validates :title, presence: true, length: { maximum: 100 }
  validates :user, presence: true
  validates :checklist, presence: true
  validates :checklist_template, presence: true

  def initialize(checklist_template_params, user)
    @user = user
    @title = checklist_template_params[:checklist][:title]
    @checklist_template = user.checklist_templates.build(
      visibility: checklist_template_params[:visibility],
      title: @title
    )
    @checklist = user.checklists.build(checklist_template: @checklist_template, title: @title)
  end

  def save
    return false unless valid?

    checklist_template.save!
    checklist.save!
  end
end
