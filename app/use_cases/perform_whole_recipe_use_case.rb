# frozen_string_literal: true

class PerformWholeRecipeUseCase < ApplicationUseCase

  def call
    start_time
    get_recipe
    recipe_items.each do |item|
      perform_recipe_step(item)
      update_recipe_step(item)
    end
    elapsed_time
    store_event
    response
  end

  private

  attr_reader :recipe_items

  def start_time
    @start_time = Time.now
  end

  # Take ItemComparison elements with date_of_evaluation equal to
  # Setting.last_products_comparison and status equal to 'pending'.
  def get_recipe
    @recipe_items = ItemComparison.where(date_of_evaluation: Setting.last_products_comparison, status: 'pending')
  end

  def perform_recipe_step(item)
    PerformStepOfRecipeUseCase.call(item)
    sleep(2.seconds)
    Rails.logger.info("Step performed: #{item.id}. Sleeping some time to avoid rate limit.")

    # If something goes wrong with PerformStepOfRecipeUseCase, we want to
    # update the status of the item to 'error' so we can try again later.
  rescue StandardError => e
    item.update(status: 'error')
    # Also, we want to log the error in Event model.
    Event.create(
      event_type: 'error',
      event_message: "Error in PerformStepOfRecipeUseCase: #{e.message}"
    )
  end

  def store_event
    Event.create(
      event_type: 'info',
      event_message: "Recipe performed. Elapsed time: #{elapsed_time}"
    )
  end

  def update_recipe_step(item)
    item.update(status: 'done')
  end

  def elapsed_time
    Time.now - @start_time
  end

  def response
    { message: 'Recipe performed successfully', elapsed_time: elapsed_time }
  end
end
