require "nanoc"
require "nanoc/cli"

desc "Compile the Site"
task :compile do
  Dir.chdir(RakeRoot) do
    Nanoc::CLI.run(%w(compile))
  end
end
