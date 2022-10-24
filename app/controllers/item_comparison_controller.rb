# frozen_string_literal: true

class ItemComparisonController < ApplicationController
  def index
    @items = ItemComparison.all
  end

  def compare
    MakeListOfChangesJob.perform_later
    render json: { message: 'Comparison is being built. This process could take some time... Please, do not retry the action.' }
  end
end
