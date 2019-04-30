class TemplateItem < ApplicationRecord
  has_many :item_usages, class_name: 'Item'
  belongs_to :checklist_template

  validates :title, presence: true, length: { maximum: 100 }
end
