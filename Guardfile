require "bundler"
Bundler.require

sprockets = Sprockets::Environment.new
sprockets.append_path "css"
sprockets.append_path "js"

def log(msg)
  time = Time.now.strftime("%H:%M:%S")
  $stdout.puts "#{time} : #{msg}"
end

def asset(file)
  version = File.mtime(File.join("public/", file)).to_i
  "#{file}?v=#{version}"
end

guard :shell do
  watch /^css\/.+/ do |file|
    log(file.first)
    
    File.open("public/application.css", "w+") do |f|
      f.write sprockets["application.sass"].to_s
    end
  end
  
  watch /^js\/.+/ do |file|
    log(file.first)
    
    File.open("public/application.js", "w+") do |f|
      f.write sprockets["application.coffee"].to_s
    end
  end
  
  watch /^pages\/([^\/]+)\.[a-z]+$/ do |file|
    log(file.first)
    
    body = Tilt.new(file.first).render(self)
    html = Tilt.new("pages/layouts/application.html.slim").render(self) { body }
    
    File.open("public/#{file.last}", "w+") { |f| f.write html }
  end
end
