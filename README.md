# covid19-twitter-icon

[![CI](https://github.com/matsubo/covid19-twitter-icon/actions/workflows/main.yml/badge.svg)](https://github.com/matsubo/covid19-twitter-icon/actions/workflows/main.yml)
[![Release](https://github.com/matsubo/covid19-twitter-icon/actions/workflows/release.yml/badge.svg)](https://github.com/matsubo/covid19-twitter-icon/actions/workflows/release.yml)
[![GitHub release](https://img.shields.io/github/v/release/matsubo/covid19-twitter-icon?sort=semver)](https://github.com/matsubo/covid19-twitter-icon/releases)
[![GHCR](https://img.shields.io/badge/ghcr.io-matsubo%2Fcovid19--twitter--icon-blue?logo=docker)](https://github.com/matsubo/covid19-twitter-icon/pkgs/container/covid19-twitter-icon)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Ruby](https://img.shields.io/badge/Ruby-3.3-CC342D?logo=ruby&logoColor=white)](https://www.ruby-lang.org/)

Generates Twitter (X) icons for the 47 prefectures of Japan. Originally built for COVID-19 awareness; the overlay text is now configurable so the same generator works for any short label.

## Sample

![image](https://user-images.githubusercontent.com/98103/87874728-1ab6f080-ca07-11ea-8b61-768e2eaa6da6.png)

## Download the iconset

Pre-built iconset bundles are attached to each [GitHub Release](https://github.com/matsubo/covid19-twitter-icon/releases) as `covid19-twitter-icon-<version>.zip` — no build needed.

## Requirements

- Docker, or Ruby 3+ with ImageMagick installed locally
- [`just`](https://github.com/casey/just) (optional, for task shortcuts)

## Quick start (Docker)

Use the published image from GitHub Container Registry:

```sh
docker run --rm -v "$PWD/output:/app/output" ghcr.io/matsubo/covid19-twitter-icon:latest
```

Or build locally with `docker compose`:

```sh
docker compose run --rm app bundle install
docker compose run --rm app bundle exec ruby main.rb
```

PNGs are written to `output/`.

## Quick start (local Ruby)

```sh
bundle install
bundle exec ruby main.rb
```

## CLI options

```sh
bundle exec ruby main.rb --text "STAY HOME" --output-dir output --color "#000000"
```

| Flag           | Default     | Description                              |
| -------------- | ----------- | ---------------------------------------- |
| `--text`       | `COVID-19`  | Top overlay text                         |
| `--output-dir` | `output`    | Directory for generated PNGs             |
| `--color`      | `#000000`   | Prefecture text color                    |
| `--data`       | `prefectures.json` | Path to prefectures JSON          |

## Compress PNGs

```sh
./compress.sh
```

## Tasks (justfile)

```sh
just generate     # generate icons
just compress     # pngquant compress
just test         # run rspec
just lint         # run rubocop
just package v1.0.0   # zip the iconset
just release v1.0.0   # generate + compress + package
```

## Releases & packages

Push a `v*` tag (or run the **Release** workflow manually) to:

1. Build the full iconset, compress with `pngquant`, and attach the zip bundle to a [GitHub Release](https://github.com/matsubo/covid19-twitter-icon/releases).
2. Build and publish a Docker image to [GitHub Container Registry](https://github.com/matsubo/covid19-twitter-icon/pkgs/container/covid19-twitter-icon) tagged `latest`, `vX.Y.Z`, and `vX.Y`.

## Fonts

- COVID-19 label: [Furore](https://fontmeme.com/jfont/furore-font/)
- Prefecture name: [Rounded M+](http://jikasei.me/font/rounded-mplus/about.html)

## License

[MIT](LICENSE)

## Support

<a href="https://www.buymeacoffee.com/matsubokkuri" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" height="41" width="174"></a>

## Author

[Yuki Matsukura](https://matsu.teraren.com/) — [@matsubokkuri on X](https://x.com/matsubokkuri)
