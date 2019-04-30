class CreateChecklistTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :checklist_templates do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
