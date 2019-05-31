# When user want to create checklist throw checklist_controller
# it creates checklist template and checklist
class ChecklistCreationService
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
    @title = checklist_template_params[:title]
    @checklist_template = user.checklist_templates.build(checklist_template_params)
    @checklist = @checklist_template.checklists.build(title: @checklist_template.title, user: @user)
  end

  def save
    return false unless valid?

    checklist_template.save!
    checklist.save!
  end
end
