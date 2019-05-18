class AddVisibilityToChecklistTemplate < ActiveRecord::Migration[5.2]
  def change
    add_column :checklist_templates, :visibility, :string, default: "everyone"
  end
end
