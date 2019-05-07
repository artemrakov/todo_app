# User Template checklist where you can:
# add template_items
# create checklists from this template
class ChecklistTemplate < ApplicationRecord
  has_many :checklists
  has_many :template_items
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
end
