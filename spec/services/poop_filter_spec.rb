# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PoopFilter do
  context '#filter' do
    let(:options) { { query: { text: text } } }
    let(:perform) { subject.filter(text) }
    let(:url) { 'http://poopfilter.herokuapp.com/filter' }

    context 'text with censured words' do
      let(:text) { 'fuck this shit!' }
      it 'returns without censured text' do
        expected_response = 'REDACTED this REDACTED!'
        expect(perform).to eq(expected_response)
      end
    end

    context 'test the httparty flow ' do
      let(:text) { 'text' }
      let(:parsed_response) { { 'output' => text } }
      let(:response) { double(:response, parsed_response: parsed_response) }

      it 'returns the text' do
        expect(HTTParty).to receive(:post)
          .with(url, options)
          .and_return(response)

        expect(response).to receive(:parsed_response)
          .and_return(parsed_response)

        expect(perform).to eq(text)
      end
    end
  end
end