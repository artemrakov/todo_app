require 'rails_helper'

RSpec.describe Item, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to belong_to :template_item }
  it { is_expected.to belong_to :checklist }
end
