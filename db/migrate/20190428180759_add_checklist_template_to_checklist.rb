class AddChecklistTemplateToChecklist < ActiveRecord::Migration[5.2]
  def change
    add_reference :checklists, :checklist_template, foreign_key: true
  end
end
