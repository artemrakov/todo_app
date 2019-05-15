class ChecklistTemplateCollectionView
  attr_reader :checklist_templates
  attr_reader :pagination

  def initialize(params)
    @params = params
    @checklist_templates = collection
  end

  def collection
    if search?
      ChecklistTemplate.search(@params[:search], page: @params[:page])
    else
      ChecklistTemplate.paginate(page: @params[:page])
    end
  end

  def search?
    @params[:search].present?
  end

  def collection_title
    search? ? I18n.t('views.checklist_templates.index.search') : I18n.t('views.checklist_templates.index.title')
  end
end
