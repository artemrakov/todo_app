# User's checklist based on checklist template
class Checklist < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :user
  belongs_to :checklist_template

  # find checklists that have not_done items and this checklists will be due next day
  # will not find checklist that have no items
  scope :due_date_tomorrow, lambda {
    joins(:items).where(items: { state: :not_done })
                 .where(due_date: Date.current.in_time_zone..Date.tomorrow.end_of_day.in_time_zone)
                 .distinct
  }

  validates :title, presence: true, length: { maximum: 100 }
end
