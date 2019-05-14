class ChecklistTemplateCollectionView
  attr_reader :checklist_templates, :params

  def initialize(params)
    @params = params
    @checklist_templates = collection
  end

  def collection
    if search?
      ChecklistTemplate.search(params[:search])
    else
      ChecklistTemplate.all
    end
  end

  def search?
    params[:search].present?
  end

  def title_of_the_page
    search? ? I18n.t('views.checklist_templates.index.search') : I18n.t('views.checklist_templates.index.title')
  end
end
