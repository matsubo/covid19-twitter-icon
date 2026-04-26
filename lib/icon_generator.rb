# frozen_string_literal: true

require 'fileutils'
require 'mini_magick'

# Renders a single 550x550 prefecture icon with a configurable header label.
class IconGenerator
  DEFAULT_OPTIONS = {
    size: '550x550',
    background: '#FFFFFF',
    header_text: 'COVID-19',
    header_color: '#999999',
    header_font: 'fonts/Furore.otf',
    header_pointsize: 90,
    header_offset: '+0-110',
    label_color: '#000000',
    label_font: 'fonts/rounded-mplus-2p-medium.ttf',
    label_pointsize: 150,
    label_offset: '+0+20',
    output_dir: 'output'
  }.freeze

  def initialize(options = {})
    @options = DEFAULT_OPTIONS.merge(options)
    FileUtils.mkdir_p(@options[:output_dir])
  end

  def generate(prefecture)
    file = File.join(@options[:output_dir], "#{prefecture.slug}.png")
    render(prefecture.name, file)
    FileUtils.chmod(0o644, file)
    file
  end

  private

  def render(label, file)
    opts = @options
    MiniMagick::Tool::Convert.new do |c|
      c.size opts[:size]
      c << "canvas:#{opts[:background]}"
      c << '-gravity' << 'Center'

      c << '-fill' << opts[:header_color]
      c << '-font' << opts[:header_font]
      c << '-pointsize' << opts[:header_pointsize].to_s
      c << '-annotate' << opts[:header_offset] << opts[:header_text]

      c << '-fill' << opts[:label_color]
      c << '-font' << opts[:label_font]
      c << '-pointsize' << opts[:label_pointsize].to_s
      c << '-annotate' << opts[:label_offset] << label
      c << file
    end
  end
end
