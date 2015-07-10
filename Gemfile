source 'https://rubygems.org'

gem 'rails',                   '4.2.3'
gem 'bootstrap-sass',          '3.2.0.0'
gem 'sass-rails',              '5.0.2'
gem 'uglifier',                '2.5.3'
gem 'coffee-rails',            '4.1.0'
gem 'jquery-rails',            '4.0.4'
gem 'turbolinks',              '2.3.0'
gem 'jbuilder',                '2.2.3'
gem 'sdoc',                    '0.4.0', group: :doc
gem 'bcrypt',                  '3.1.7'
gem 'faker',                   '1.4.2'
gem 'carrierwave',             '0.10.0'
gem 'mini_magick',             '3.8.0'
gem 'fog',                     '1.23.0'
gem 'will_paginate',           '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'
gem 'haml-rails',              '~> 0.9'

group :development, :test do
  #gem 'sqlite3',      '1.3.9'
  gem "mysql2"
  gem 'byebug',       '3.4.0'
  gem 'web-console',  '2.1.3'
  gem 'spring',       '1.1.3'
  gem 'growl'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'minitest-line'
end

group :development do
  gem 'erb2haml'
end

group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
end

group :production do
#  gem 'pg',             '0.17.1'
  gem 'mysql2'
  gem 'rails_12factor', '0.0.2'
#  gem 'puma',           '2.11.1'
  gem 'unicorn'
end
