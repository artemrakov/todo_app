class AddVisabilityToChecklistTemplate < ActiveRecord::Migration[5.2]
  def change
    add_column :checklist_templates, :visability, :string, default: "everyone"
  end
end
