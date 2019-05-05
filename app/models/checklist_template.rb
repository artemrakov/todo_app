# User Template checklist:
# add template_items
# create checklists from this template
# add tags
class ChecklistTemplate < ApplicationRecord
  has_many :checklists
  has_many :template_items

  acts_as_taggable
  searchkick

  validates :title, presence: true, length: { maximum: 100 }
end
