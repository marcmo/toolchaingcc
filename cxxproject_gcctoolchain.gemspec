# -*- encoding: utf-8 -*-
gem_name = 'cxxproject_gcctoolchain'
require File.expand_path("lib/#{gem_name}/version")

Gem::Specification.new do |s|
  s.name = gem_name
  s.version = CxxprojectGccToolchain::VERSION

  s.summary = "toolchain support for gcc."
  s.description = <<-EOF
    Toolchain supporting GCC
  EOF
  s.files = `git ls-files`.split($\)
  s.require_path = "lib"
  s.author = "oliver mueller"
  s.email = "oliver.mueller@gmail.com"
  s.homepage = "https://github.com/marcmo/cxxproject"

  s.add_dependency('cxxproject')
end
