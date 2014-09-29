require "pathname"

RakeRoot = Pathname.new(Rake.application.find_rakefile_location.last)

Dir[RakeRoot+'lib/tasks/*.rake'].each { |task| load task }

task :test => [:compile, :checks]
task :default => :test
