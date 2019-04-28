class Item < ApplicationRecord
  belongs_to :checklist
  belongs_to :template_item

  def title
    template_item.title
  end
end
