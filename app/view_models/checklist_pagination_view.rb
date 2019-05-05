class ChecklistPaginationView
  include Pagy::Backend
  attr_reader :pagination, :checklists, :params

  def initialize(params)
    @params = params
    # pagy requires params to work more here https://ddnexus.github.io/pagy/how-to#environment-assumptions
    @pagination, @checklists = pagy(Checklist.all)
  end
end
