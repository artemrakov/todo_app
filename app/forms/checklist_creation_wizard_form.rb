class ChecklistCreationWizardForm
  include ActiveModel::Model

  attr_reader :checklist_template
  attr_reader :user
  attr_accessor :title
  attr_reader :checklist

  validates :title, presence: true, length: { maximum: 100 }

  def initialize(checklist_template_params, user)
    @user = user
    @title = checklist_template_params[:title]
    @checklist_template = user.checklist_templates.build(checklist_template_params)
    @checklist = Checklist.new(checklist_template: @checklist_template, user: @user, title: @title)
  end

  def save
    return false unless valid?

    checklist_template.save!
    checklist.save!
  end
end
