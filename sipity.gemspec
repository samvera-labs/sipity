lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sipity/version'

Gem::Specification.new do |spec|
  spec.name          = 'sipity'
  spec.version       = Sipity::VERSION
  spec.authors       = ['Justin Coyne']
  spec.email         = ['jcoyne@justincoyne.com']

  spec.summary       = 'State based workflow engine for ActiveRecord'
  spec.description   = 'Sipity manages state for various resources as the move through workflows'
  spec.homepage      = 'https://github.com/samvera-labs/sipity'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'railties', '~> 5.1'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'engine_cart'
  spec.add_development_dependency 'factory_bot_rails', '~> 4.4'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its', '~> 1.1'

end
