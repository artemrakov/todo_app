class ChecklistTemplatePaginationView
  include Pagy::Backend
  attr_reader :pagination, :checklist_templates, :params

  def initialize(params)
    @params = params
    # pagy requires params to work more here https://ddnexus.github.io/pagy/how-to#environment-assumptions
    @pagination, @checklist_templates = pagy(ChecklistTemplate.all)
  end
end
