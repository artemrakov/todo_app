class AddPrivateToChecklistTemplate < ActiveRecord::Migration[5.2]
  def change
    add_column :checklist_templates, :private, :boolean, default: false
  end
end
