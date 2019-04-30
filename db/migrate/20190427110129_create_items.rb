class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.boolean :done, default: false, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
