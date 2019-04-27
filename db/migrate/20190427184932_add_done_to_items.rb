class AddDoneToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :done, :boolean, default: false
  end
end
