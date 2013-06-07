RakeRoot = Pathname.new(Rake.application.find_rakefile_location.last)

require "net/https"
require "nanoc"
require "nanoc/cli"

task :default => :test

desc "Compile & Test"
task :spec => :test
task :test => [:check_ssl, :deploy] do
  Dir.chdir(RakeRoot) do
    Nanoc::CLI.run(%w(check stale))
    Nanoc::CLI.run(%w(check internal_links))
    # Nanoc::CLI.run(%w(check external_links))
  end
end

desc "Deploy the Site"
task :deploy do
  Dir.chdir(RakeRoot) do
    Nanoc::CLI.run(%w(compile))
  end
end

desc "Check if SSL certificate is valid."
task :check_ssl do
  http = Net::HTTP.new("rvm.io", 443)
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  http.use_ssl = true

  cert = nil
  http.start do |h|
    cert = h.peer_cert
  end

  if (Time.new + 432000) > cert.not_after
    abort("There is a imminent problem brewing with SSL, it expires on: #{cert.not_after}")
  end
end
