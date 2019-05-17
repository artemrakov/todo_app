# User Template checklist:
# this template creates checklists with items and
# can be used multiple times to create different checklists with same items
class ChecklistTemplate < ApplicationRecord
  include AASM

  has_many :checklists
  has_many :template_items
  belongs_to :user

  acts_as_taggable
  searchkick

  validates :title, presence: true, length: { maximum: 100 }

  aasm.attribute_name :visibility

  aasm do
    state :everyone, initial: true
    state :owner
    state :one_time

    event :to_public do
      transitions from: %i[owner one_time], to: :everyone
    end

    event :to_private do
      transitions from: %i[everyone one_time], to: :owner
    end

    event :to_one_time do
      transitions from: %i[everyone owner], to: :one_time
    end
  end
end
