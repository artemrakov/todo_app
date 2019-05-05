# User Template checklist:
# add template_items
# create checklists from this template
# add tags
class ChecklistTemplate < ApplicationRecord
  acts_as_taggable
  has_many :checklists
  has_many :template_items

  validates :title, presence: true, length: { maximum: 100 }
end
