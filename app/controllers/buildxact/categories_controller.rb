class Buildxact::CategoriesController < ApplicationController
  def index
    @categories = Buildxact::Category.all
  rescue NoMethodError => e
    # Ignore and keep going
  end
end

