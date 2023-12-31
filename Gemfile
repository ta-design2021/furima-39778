source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.0"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use mysql as the database for Active Record
gem "mysql2", "~> 0.5"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  # 20230914下記を追記
  gem 'rspec-rails', '~> 4.0.0'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'gimei'
  # 20230929Capistranoを利用するため追記
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# 20230910下記を追記
group :development do
  gem 'rubocop', require: false
end

# 20230910下記を追記
# 本番環境（Render）のデータベース（PostgreSQL）を使用できるようGemを追加
# 20230929にEC2でデプロイするためにコメントアウト（bundle installの邪魔になるので）
group :production do
  # gem 'pg'
  # 20230929下記を追記
# Unicornを使用できるようGemを追加
  gem 'unicorn', '6.1.0'
end

# 20230913下記を追記
# ユーザー管理機能を使用できるようGemを追加
gem 'devise'
gem 'pry-rails'
# 20230915下記を追記
# 変更されないデータをモデルファイル内に直接記述することで、データベースへ保存せずにデータを取り扱うことができるGemを追加
gem 'active_hash'
# 20230917下記を追記
# 画像アップロード機能
gem 'mini_magick'
gem 'image_processing', '~> 1.2'
# 20230923下記を追記
# 決済処理
gem 'payjp'
# 20230924下記を追記
# クライアントサイドで環境変数を読み込めるように
gem 'gon'
# 20230926下記を追記
# 日本語に対応するように
gem 'rails-i18n'
# 20230927下記を追記
# S3に画像を保存する
gem "aws-sdk-s3", require: false
