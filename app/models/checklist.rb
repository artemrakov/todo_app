class Checklist < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :user
  belongs_to :checklist_template
end
