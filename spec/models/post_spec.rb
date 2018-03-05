# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'when saving' do
    let(:filtered_text) { 'filtered-text' }
    let(:text) { 'text' }

    subject { FactoryBot.build(:post, message: text) }

    it 'should call PoopFilter' do
      allow(PoopFilter)
        .to receive(:filter)
        .and_return(filtered_text)

      subject.save!

      expect(PoopFilter)
        .to have_received(:filter)
        .with(text)

      expect(subject.message).to eq(filtered_text)
    end
  end
end
