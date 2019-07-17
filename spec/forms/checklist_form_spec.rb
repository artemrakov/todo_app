require 'rails_helper'

RSpec.describe ChecklistForm do
  subject { described_class.new(params) }
  before { subject.validate }
  let(:errors) { subject.errors.messages.keys }

  context 'with valid params' do
    let(:params) do
      {
        title: 'hello',
        visibility: 'everyone'
      }
    end

    it { expect(errors).not_to include :title }
    it { expect(errors).not_to include :visibility }
    it { is_expected.to be_valid }
  end

  context 'with invalid params' do
    let(:params) { {} }

    it { expect(errors).to include :title }
    it { expect(errors).to include :visibility }
    it { is_expected.to_not be_valid }
  end
end