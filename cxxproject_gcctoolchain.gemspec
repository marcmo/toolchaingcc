include FileUtils

PKG_VERSION = "0.1.4"

Gem::Specification.new do |s|
  s.name = "cxxproject_gcctoolchain"
  s.version = PKG_VERSION
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
