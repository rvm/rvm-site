require "pry"

Dir["content/**/*.{md,haml,html}"].each do |f|
  name = (f = File.expand_path(f)).match(/(.+)\.(md|haml|html)/)[1]

  if File.file?(yf = name + ".yaml")
    old_file_data = File.read(f)
    File.open(f, "w+") do |io|
      io.puts(File.read(yf).strip + "\n---\n\n" + old_file_data)
    end

    File.unlink(yf)
  end
end
