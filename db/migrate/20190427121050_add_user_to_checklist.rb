class AddUserToChecklist < ActiveRecord::Migration[5.2]
  def change
    add_reference :check_lists, :user, foreign_key: true
  end
end
