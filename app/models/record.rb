class Record < ActiveRecord::Base
  belongs_to :category

  validates :date, :presence => true
  validates :fee,  :presence => true
end
