# frozen_string_literal: true

class ItemComparisonController < ApplicationController
  def index
    @items = ItemComparison.all
  end
end
