class ChecklistForm
  include ActiveModel::Model

  attr_accessor :title, :visibility

  validates :title, presence: true, length: { maximum: 100 }
  validates :visibility, presence: true

  def states
    ChecklistTemplate.aasm.states.map(&:name).map(&:to_s)
  end
end
