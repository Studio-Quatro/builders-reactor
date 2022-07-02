# frozen_string_literal: true

# Base class for services
# rubocop : disable Style/StaticClass
class ApplicationUseCase
  def self.call(*args, &)
    new(*args, &).call
  end
end
# rubocop : enable Style/StaticClass