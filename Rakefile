require "net/https"
require "nanoc"
require "nanoc/cli"
require "./lib/external_links"

task :default => :test
task :spec => :test

desc "Remove the public/ dir"
task :clean_public do
  sh "rm -r public"
end

desc 'Compile the site, then verify internal and external links.'
task :test do
  Nanoc::CLI.run %w(compile)
  Nanoc::CLI.run %w(check stale)
  Nanoc::CLI.run %w(check internal_links)
  Nanoc::CLI.run %w(check external_links)
end

desc "Deploy the site"
task :deploy do
  Nanoc::CLI.run %w(compile)
end

desc "Check if our SSL certificate is valid."
task :check_ssl do
  http = Net::HTTP.new("rvm.io", 443)
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  http.use_ssl = true

  cert = nil
  http.start do |h|
    cert = h.peer_cert
  end

  if (Time.new + 432000) > cert.not_after
    abort("expires_soon")
  end

  $stdout.puts "OK"
end
