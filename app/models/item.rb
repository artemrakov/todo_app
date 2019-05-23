# Item that only exist in checklist and based on template item
class Item < ApplicationRecord
  include AASM

  belongs_to :checklist
  belongs_to :template_item

  validates :title, presence: true, length: { maximum: 100 }

  # find items that will be due next day and have state not_done
  scope :due_date_tomorrow, lambda {
    where("due_date BETWEEN ? AND ?", Date.current.in_time_zone, Date.tomorrow.end_of_day.in_time_zone)
      .where(state: :not_done)
  }

  aasm.attribute_name :state

  aasm do
    state :not_done, initial: true
    state :done

    event :complete do
      transitions from: :not_done, to: :done
    end

    event :undo do
      transitions from: :done, to: :not_done
    end
  end
end
