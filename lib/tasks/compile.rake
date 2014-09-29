require "nanoc"
require "nanoc/cli"

desc "Compile the Site"
task :compile do
  Dir.chdir(RakeRoot) do
    (RakeRoot + 'public/').tap{ |dir| dir.rmtree ; dir.mkdir }
    Nanoc::CLI.run(%w(compile))
  end
end
