# frozen_string_literal: true

require 'spec_helper'
require 'icon_generator'
require 'prefecture'
require 'tmpdir'

RSpec.describe IconGenerator do
  let(:prefecture) { Prefecture.new(name: '東京都', reading: 'とうきょう', slug: 'tokyo') }

  describe '#initialize' do
    it 'creates the output directory' do
      Dir.mktmpdir do |dir|
        target = File.join(dir, 'icons')
        described_class.new(output_dir: target)
        expect(Dir.exist?(target)).to be(true)
      end
    end
  end

  describe '#generate' do
    it 'returns the expected output path' do
      Dir.mktmpdir do |dir|
        gen = described_class.new(output_dir: dir, header_text: 'TEST')
        fake_tool = Object.new
        captured_args = []
        fake_tool.define_singleton_method(:size) { |*args| args }
        fake_tool.define_singleton_method(:<<) { |arg| captured_args << arg; self }
        allow(MiniMagick::Tool::Convert).to receive(:new).and_yield(fake_tool).and_return(fake_tool)
        allow(FileUtils).to receive(:chmod)

        path = gen.generate(prefecture)

        expect(path).to eq(File.join(dir, 'tokyo.png'))
        expect(captured_args).to include('TEST', '東京都')
      end
    end
  end
end
