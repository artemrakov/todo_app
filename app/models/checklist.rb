# User's checklist based on checklist template
class Checklist < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :user
  belongs_to :checklist_template

  validates :title, presence: true, length: { maximum: 100 }
end
