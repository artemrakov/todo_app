class Checklist < ApplicationRecord
  has_many :items
  belongs_to :user
  belongs_to :checklist_tempalate
end
