class ShowController < ApplicationController
  def index
    @element = request_element
  end

  def request_element
    PolymorphicFinder
      .finding(ChecklistTemplate, :id, [:checklist_template_id])
      .finding(Checklist, :id, [:checklist_id])
      .find(params)
  end
end
