class ChecklistCollectionView
  attr_reader :checklists

  def initialize(params)
    @params = params
    @checklists = Checklist.paginate(page: @params[:page])
  end
end
