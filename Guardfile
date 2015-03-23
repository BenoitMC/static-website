require "bundler"
Bundler.require

sprockets = Sprockets::Environment.new
sprockets.append_path "css"
sprockets.append_path "js"

guard :shell do
  watch /sass/ do
    File.open("public/application.css", "w+") do |f|
      f.write sprockets["application.sass"].to_s
    end
  end
  
  watch /coffee/ do
    File.open("public/application.js", "w+") do |f|
      f.write sprockets["application.coffee"].to_s
    end
  end
  
  watch /pages\/([^\/]+)\.[a-z]+$/ do |file|
    body = Tilt.new(file.first).render(self)
    html = Tilt.new("pages/layouts/application.html.slim").render(self) { body }
    
    File.open("public/#{file.last}", "w+") { |f| f.write html }
  end
end
