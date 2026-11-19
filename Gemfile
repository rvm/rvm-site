source "https://rubygems.org"

gem "nanoc", "~> 4.14"
gem "haml", "~> 6.3"
gem "rdiscount", "~> 2.2"
gem "nokogiri", "~> 1.18"
gem "builder", "~> 3.3"
gem "adsf", "~> 1.5"
gem "webrick", "~> 1.9"

group :development, :test do
  gem "rake"
  gem "adsf-live"
  gem "pry"
end

# Nanoc loads gems in this group as plugins (adds the `nanoc live` command).
group :nanoc do
  gem "nanoc-live"
end
