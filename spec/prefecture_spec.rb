# frozen_string_literal: true

require 'spec_helper'
require 'prefecture'
require 'tempfile'

RSpec.describe Prefecture do
  describe '.from_row' do
    it 'maps a row array to fields' do
      pref = described_class.from_row(['東京都', 'とうきょう', 'tokyo'])
      expect(pref.name).to eq('東京都')
      expect(pref.reading).to eq('とうきょう')
      expect(pref.slug).to eq('tokyo')
    end

    it 'coerces nil reading to empty string' do
      pref = described_class.from_row(['北海道', nil, 'hokkaido'])
      expect(pref.reading).to eq('')
    end
  end

  describe '.load_all' do
    it 'loads all 47 prefectures from the bundled JSON' do
      list = described_class.load_all('prefectures.json')
      expect(list.size).to eq(47)
      expect(list.map(&:slug)).to include('tokyo', 'osaka', 'okinawa', 'hokkaido')
    end

    it 'parses a custom JSON file' do
      Tempfile.create(['data', '.json']) do |f|
        f.write('[["A県","えー","a"]]')
        f.flush
        list = described_class.load_all(f.path)
        expect(list.first.slug).to eq('a')
      end
    end
  end
end
