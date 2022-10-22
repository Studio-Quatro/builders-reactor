# frozen_string_literal: true

# Interface to declare a method for building a chain of handlers.
class BaseChainHandler
  def next_handler=(handler)
    raise(NotImplementedError, "#{self.class} has not implemented method '#{__method__}'.")
  end

  def handle(request)
    raise(NotImplementedError, "#{self.class} has not implemented method '#{__method__}'.")
  end
end
