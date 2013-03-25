require 'nanoc'
require 'nanoc/cli'
require "./lib/external_links"

task :default => :test
task :spec => :test

desc "Remove the public/ dir"
task :clean_public do
  sh "rm -r public"
end

desc 'Compile the site, then verify internal and external links.'
task :test do
  Nanoc::CLI.run %w( compile )
  Nanoc::CLI.run %w( check stale )
  Nanoc::CLI.run %w( check internal_links )
  Nanoc::CLI.run %w( check external_links )
end
