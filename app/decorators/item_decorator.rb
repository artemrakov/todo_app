class ItemDecorator < Draper::Decorator
  delegate_all

  delegate :user, to: :checklist
end
