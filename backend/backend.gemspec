Gem::Specification.new do |s|
  s.name        = 'backend'
  s.version     = '0.0.1'
  s.summary     = 'sample backend-module for neo4j-script extension'
  s.description = 'sample backend-module for neo4j-script extension.'

  s.author       = 'Thomas Baum'
  s.email        = 'thomas.baum@atns.de'
  s.homepage     = 'https://github.com/tbaum/script-extension-example'

  s.files        = Dir['lib/**/*']
  s.require_path = 'lib'

  s.add_dependency('sinatra', '~> 1.2.6')
  s.add_dependency('neo4j', '~> 1.1.2')
end
