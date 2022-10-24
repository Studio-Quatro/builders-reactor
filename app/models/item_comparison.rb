class ItemComparison < ApplicationRecord
  enum status: { pending: 0, done: 1, failed: 2 }
end
