class AddOneTimeAndPrivateToChecklistTemplate < ActiveRecord::Migration[5.2]
  def change
    add_column :checklist_templates, :usage, :string, null: false, default: 'multiple'
    add_column :checklist_templates, :private, :boolean, default: false
  end
end
