require "net/https"

nanoc_checks = %w[ stale internal_links external_links ]

desc "Run nanoc checks"
task :checks => (nanoc_checks+[:ssl]).map{|c| :"check_#{c}"}

nanoc_checks.each do |task_name|
  desc "Nanoc check #{task_name}"
  task :"check_#{task_name}" do
    Nanoc::CLI.run(['check', task_name])
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
