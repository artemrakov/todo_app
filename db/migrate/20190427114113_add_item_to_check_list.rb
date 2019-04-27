class AddItemToCheckList < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :checklist, foreign_key: true
  end
end
