$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'gitloc/version'

Gem::Specification.new do |s|
  s.name        = 'gitloc-joshcheek'
  s.version     = Gitloc::VERSION
  s.licenses    = ['MIT']
  s.summary     = "Example project -- gives lines-of-code information for a git repo"
  s.description = "Example project for the Turing School of Software and Design, see https://github.com/JoshCheek/elective-building-a-gem -- gives lines-of-code information for a git repo."
  s.authors     = ["Josh Cheek"]
  s.email       = 'josh.cheek@gmail.com'
  s.files       = Dir["**/*"].select { |f| File.file? f } - Dir['*.gem']
  s.homepage    = 'https://github.com/JoshCheek/elective-building-a-gem'
  s.executables << 'gitloc'
end
