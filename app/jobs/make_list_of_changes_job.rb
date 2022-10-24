# frozen_string_literal: true

class MakeListOfChangesJob < ApplicationJob
  queue_as :default

  def perform
    MakeListOfChangesUseCase.call
  end
end
