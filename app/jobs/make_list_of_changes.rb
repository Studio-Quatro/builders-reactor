# frozen_string_literal: true

class MakeListOfChanges < ApplicationJob
  queue_as :default

  def perform
    MakeListOfChangesUseCase.call
  end
end
