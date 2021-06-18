# covid19-twitter-icon

![CI](https://github.com/matsubo/covid19-twitter-icon/workflows/CI/badge.svg)

47都道府県のTwitterアイコンを自動生成します。


## Setup

```
% docker-compose run --rm app bundle
```


## Generate png files

```
% docker-compose run --rm app bundle exec ruby main.rb
```

## Compress png file

```
% ./compress.sh
```

## Reference

Font name

- covid-19
  - https://fontmeme.com/jfont/furore-font/
- prefecture name
  - http://jikasei.me/font/rounded-mplus/about.html

<a href="https://www.buymeacoffee.com/matsubokkuri" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>


## Sample

![image](https://user-images.githubusercontent.com/98103/87874728-1ab6f080-ca07-11ea-8b61-768e2eaa6da6.png)

## Author

[Yuki Matsukura](https://matsu.teraren.com/)

