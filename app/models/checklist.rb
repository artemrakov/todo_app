class Checklist < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :user
end
