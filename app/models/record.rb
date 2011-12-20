class Record < ActiveRecord::Base
  belongs_to :category

  validates :date, :presence => true
  validates :fee,  :presence => true

  scope :find_by_month, lambda{|month| where('date like ?', month + '%').order('date desc')}
end
