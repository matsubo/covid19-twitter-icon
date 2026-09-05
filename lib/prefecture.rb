# frozen_string_literal: true

require 'json'

# Value object for a single prefecture row from prefectures.json.
Prefecture = Struct.new(:name, :reading, :slug, keyword_init: true)

class Prefecture
  DEFAULT_PATH = File.expand_path('../prefectures.json', __dir__)

  def self.from_row(row)
    new(name: row[0], reading: row[1].to_s, slug: row[2])
  end

  def self.load_all(path = DEFAULT_PATH)
    JSON.parse(File.read(path)).map { |row| from_row(row) }
  end
end
