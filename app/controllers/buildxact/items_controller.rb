class Buildxact::ItemsController < ApplicationController
  def index
    @items = Buildxact::Item.all
  rescue NoMethodError => e
    # Ignore and keep going

  end
end
