class ChecklistTemplateCreator
  attr_reader :checklist_template
  attr_reader :title

  def initialize(params)
    @title = params[:checklist][:title]
    @checklist_template = ChecklistTemplate.new(params[:checklist_template])
    @checklist_template.title = @title
  end
end
