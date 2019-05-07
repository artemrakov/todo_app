class AddOneTimeAndPrivateToChecklistTemplate < ActiveRecord::Migration[5.2]
  def change
    add_column :checklist_templates, :one_time, :boolean, default: false
    add_column :checklist_templates, :private, :boolean, default: false
  end
end
