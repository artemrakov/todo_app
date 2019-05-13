# User Template checklist:
# this template creates checklists with items and
# can be used multiple times to create different checklists with same items
class ChecklistTemplate < ApplicationRecord
  include AASM

  has_many :checklists
  has_many :template_items
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }

  acts_as_taggable
  searchkick

  aasm.attribute_name :usage

  aasm do
    state :multiple, initial: true
    state :one_time

    event :singe_usage do
      transitions from: :multiple, to: :one_time
    end

    event :multiple_usage do
      transitions from: :one_time, to: :multiple
    end
  end
end
