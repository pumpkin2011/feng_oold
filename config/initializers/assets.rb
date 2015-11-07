# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|woff2|ttf)$/
Rails.application.config.assets.precompile += %w(
  html5shiv/dist/html5shiv.min.js
  respond/dest/respond.min.js
  china_city/jquery.china_city.js
  admin-lte/dist/img/boxed-bg.jpg
  slick-carousel/slick/ajax-loader.gif
  job.js


  enterprise.js
  enterprise.css
  user.js
  user.css
)
