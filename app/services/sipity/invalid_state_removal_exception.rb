module Sipity
  class InvalidStateRemovalException < ::RuntimeError
    attr_reader :states
    def initialize(message, states)
      super(message)
      @states = states
    end
  end
end
