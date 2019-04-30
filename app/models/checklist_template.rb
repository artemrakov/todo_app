class ChecklistTemplate < ApplicationRecord
  has_many :checklists
  has_many :template_items

  validates :title, presence: true, length: { maximum: 100 }
end
