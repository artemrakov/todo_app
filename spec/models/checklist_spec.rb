require 'rails_helper'

RSpec.describe Checklist, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to have_many :items }
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :checklist_template }
end
