class AddStateToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :state, :string, null: false, default: "not_done"
  end
end
