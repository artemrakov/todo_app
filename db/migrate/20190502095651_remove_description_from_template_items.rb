class RemoveDescriptionFromTemplateItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :template_items, :description, :string
  end
end
