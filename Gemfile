source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.2'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 3.0'
gem 'devise'
gem 'carrierwave'
gem 'mini_magick'
gem 'haml-rails'
gem 'erb2haml'
gem "font-awesome-rails"
gem "stroke-seven-rails"

# gem 'capistrano-rails', group: :development
source 'https://rails-assets.org' do
  gem  'rails-assets-nanoscroller'
end

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'pry-rails'
  gem 'pry'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
