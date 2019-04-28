class AddChecklistTemplateToTemplateItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :template_items, :checklist_template, foreign_key: true
  end
end
