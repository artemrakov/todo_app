require 'rails_helper'

RSpec.describe TemplateItem, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to have_many :item_usages }
  it { is_expected.to belong_to :checklist_template }
end
