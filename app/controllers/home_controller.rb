class HomeController < ApplicationController
  def index
   process_outlay
   process_account

  end

  private
  def process_outlay
    @outlays = []
    @sums = []
    Category.outlay.first.categories.each do |category|
      sum = 0
      records = category.records
      unless records.empty?
        records.each do |record|
          sum += record.fee
        end
      end
      category.categories.each do |sub_cate|
        records = sub_cate.records
        unless records.empty?
          records.each do |record|
            sum += record.fee
          end
        end
      end
      if sum != 0
        @outlays.push category.name
        @sums.push sum
      end
    end
  end

  private
  def process_account
    @accounts = []
    @amounts = []
    Account.all.each do |account|
      @accounts.push account.name
      @amounts.push balance account
    end
  end

   private
   def balance account
    fund = Fund.current(account.id).first
    return fund.nil? ? 0 : fund.amount
  end

end
