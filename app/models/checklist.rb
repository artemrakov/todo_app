# User's checklist based on checklist template
class Checklist < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :user
  belongs_to :checklist_template

  scope :due_date_tomorrow, lambda {
    where("due_date BETWEEN ? AND ?", Date.current.in_time_zone, Date.tomorrow.end_of_day.in_time_zone)
  }

  validates :title, presence: true, length: { maximum: 100 }
end
