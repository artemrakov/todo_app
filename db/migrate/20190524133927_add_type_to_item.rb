class AddTypeToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :type, :string, null: false, default: ""
  end
end
