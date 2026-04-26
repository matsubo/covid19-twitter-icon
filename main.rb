# frozen_string_literal: true

require 'bundler/setup'
Bundler.require
require 'optparse'

$LOAD_PATH.unshift(File.expand_path('lib', __dir__))
require 'prefecture'
require 'icon_generator'

def parse_options(argv)
  options = {}
  OptionParser.new do |o|
    o.banner = 'Usage: ruby main.rb [options]'
    o.on('--text TEXT', 'Header overlay text (default: COVID-19)') { |v| options[:header_text] = v }
    o.on('--output-dir DIR', 'Output directory (default: output)') { |v| options[:output_dir] = v }
    o.on('--color COLOR', 'Prefecture label color (default: #000000)') { |v| options[:label_color] = v }
    o.on('--data PATH', 'Prefectures JSON path (default: prefectures.json)') { |v| options[:data] = v }
  end.parse!(argv)
  options
end

def main(argv)
  options = parse_options(argv)
  data_path = options.delete(:data) || 'prefectures.json'

  generator = IconGenerator.new(options)
  Prefecture.load_all(data_path).each do |pref|
    path = generator.generate(pref)
    puts path
  end
end

main(ARGV) if $PROGRAM_NAME == __FILE__
