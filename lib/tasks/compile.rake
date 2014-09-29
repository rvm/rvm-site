require "nanoc"
require "nanoc/cli"

desc "Compile the Site"
task :compile do
  Dir.chdir(RakeRoot) do
    (RakeRoot + 'public/').tap do |dir|
      dir.rmtree if dir.exist?
      dir.mkdir
    end
    Nanoc::CLI.run(%w(compile))
  end
end
