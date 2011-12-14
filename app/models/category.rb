class Category < ActiveRecord::Base
  belongs_to :category
  has_many   :categories

  scope :income, where(:id => 1)
  scope :outlay, where(:id => 2)
end
