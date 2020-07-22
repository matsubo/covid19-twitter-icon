# frozen_string_literal: true

require 'bundler/setup'
Bundler.require

def create(prefecture, filename)
  puts filename
  MiniMagick::Tool::Convert.new do |c|
    c.size '550x550'
    c << 'canvas:#FFFFFF'
    c << '-fill' << '#000000'
    c << '-gravity' << 'Center'

    # covid-19
    c << '-fill' << '#999999'
    c << '-font' << 'fonts/Furore.otf'
    c << '-pointsize' << '90'
    c << '-annotate' << '+0-110' << 'COVID-19'

    # prefecture
    c << '-fill' << '#000000'
    c << '-pointsize' << '150'
    c << '-font' << 'fonts/rounded-mplus-2p-medium.ttf'
    c << '-annotate' << '+0+20' << prefecture
    c << "output/#{filename}.png"
  end
end

require 'json'
prefectures = {}
File.open('prefectures.json') do |j|
  prefectures = JSON.parse(j.read)
end

prefectures.each do |prefecture|
  create(prefecture[0], prefecture[2])
end
