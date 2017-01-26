source "http://rubygems.org"

# adding rake so travis-ci will build properly
gem 'rake'
gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
gem 'listen', '3.0.8'
gem 'net-http-persistent'
gem 'coveralls', require: false

gemspec

if ENV['WATIR_BRANCH']
  gem 'watir', :git => 'https://github.com/watir/watir.git', :branch => ENV['WATIR_BRANCH']
end
