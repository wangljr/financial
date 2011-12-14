class Fund < ActiveRecord::Base
  belongs_to :account
  belongs_to :fundType
  has_one :fundType

  scope :current, lambda{|account| where(:account_id=> account).order('created_at desc')}

end
