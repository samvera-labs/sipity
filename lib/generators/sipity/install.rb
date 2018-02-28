# frozen_string_literal: true

module Sipity
  # The install generator for Sipity. Presently does nothing, but is required
  # for engine cart
  class Install < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
  end
end
