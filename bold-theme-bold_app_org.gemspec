$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bold-theme-bold_app_org"
  s.version     = '1.0.0'
  s.authors     = ["Jens Kraemer"]
  s.email       = ["jk@jkraemer.net"]
  s.homepage    = "https://github.com/bold-app/bold-theme-bold_app_org"
  s.summary     = "The Bold theme for bold-app.org."
  s.description = "How meta."
  s.license     = "GPL v3"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'font-awesome-rails'
end
