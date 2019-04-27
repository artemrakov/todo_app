class AddItemToCheckList < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :check_list, foreign_key: true
  end
end
