set shell := ["bash", "-cu"]

default:
    @just --list

# Install gems
install:
    bundle install

# Generate prefecture icons (override TEXT/COLOR/OUT as needed)
generate text="COVID-19" color="#000000" out="output":
    bundle exec ruby main.rb --text "{{text}}" --color "{{color}}" --output-dir "{{out}}"

# Compress PNGs in output/ via pngquant
compress:
    ./compress.sh

# Run rspec
test:
    bundle exec rspec

# Run rubocop
lint:
    bundle exec rubocop

# Auto-correct rubocop offenses
lint-fix:
    bundle exec rubocop -A

# Build a zip iconset bundle
package version="dev":
    rm -f covid19-twitter-icon-{{version}}.zip
    cd output && zip -r ../covid19-twitter-icon-{{version}}.zip . -x "*.DS_Store"
    @echo "Built covid19-twitter-icon-{{version}}.zip"

# Generate + compress + package
release version="dev":
    just generate
    just compress
    just package {{version}}
