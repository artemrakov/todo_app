class Item < ApplicationRecord
  belongs_to :checklist
  belongs_to :template_item

  validates :title, presence: true, length: { maximum: 100 }
end
