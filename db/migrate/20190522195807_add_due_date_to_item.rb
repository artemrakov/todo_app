class AddDueDateToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :due_date, :datetime
  end
end
