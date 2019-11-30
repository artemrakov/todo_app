# When user want to create checklist throw checklist_controller
# it creates checklist template and checklist
class ChecklistCreationService
  attr_reader :checklist_template, :checklist

  def initialize(checklist_form, user)
    @checklist_template = user.checklist_templates.build(checklist_form)
    @checklist = @checklist_template.checklists.build(title: checklist_form[:title], user: user)
  end

  def run
    checklist_template.save!
    checklist.save!
  end
end
