# User Template checklist:
# this template creates checklists with items and
# can be used multiple times to create different checklists with same items
class ChecklistTemplate < ApplicationRecord
  has_many :checklists
  has_many :template_items
  belongs_to :user

  acts_as_taggable
  searchkick

  validates :title, presence: true, length: { maximum: 100 }
end
