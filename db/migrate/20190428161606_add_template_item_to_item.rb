class AddTemplateItemToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :template_item, foreign_key: true
  end
end
