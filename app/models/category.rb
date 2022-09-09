class Category < ApplicationRecord
  # https://www.leighhalliday.com/tree-structures-in-your-rails-models
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'

  validates :wc_id, uniqueness: true
end
