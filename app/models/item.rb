# Item that only exist in checklist and based on template item
class Item < ApplicationRecord
  include AASM

  belongs_to :checklist

  validates :title, presence: true, length: { maximum: 100 }

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
