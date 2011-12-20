class Category < ActiveRecord::Base
  belongs_to :category
  has_many   :categories
  has_many   :records

  validates :name, :presence => true

  scope :income, where(:id => 1)
  scope :outlay, where(:id => 2)
end
