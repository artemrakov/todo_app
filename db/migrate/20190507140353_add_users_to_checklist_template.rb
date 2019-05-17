class AddUsersToChecklistTemplate < ActiveRecord::Migration[5.2]
  def change
    add_reference :checklist_templates, :user, foreign_key: true
  end
end
