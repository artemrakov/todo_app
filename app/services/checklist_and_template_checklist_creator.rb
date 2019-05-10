class ChecklistAndTemplateChecklistCreator
  include ActiveModel::Model

  attr_reader :checklist_template
  attr_reader :user
  attr_reader :title
  attr_reader :params

  validates :title, presence: true, length: { maximum: 100 }

  def initialize(params)
    @params = params
    @user = params[:user]
    @title = params[:checklist][:title]
    create_checklist_template
  end

  def save
    return false unless valid?

    checklist_template.save!
    checklist.save!
  end

  private

  def checklist
    Checklist.new(checklist_template: checklist_template, user: user, title: checklist_template.title)
  end

  def create_checklist_template
    @checklist_template = ChecklistTemplate.new(params[:checklist_template])
    @checklist_template.title = @title
    @checklist_template.user = @user
  end
end
