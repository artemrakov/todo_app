require 'rails_helper'

RSpec.describe ChecklistTemplate, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to have_many :checklists }
  it { is_expected.to have_many :template_items }
end
