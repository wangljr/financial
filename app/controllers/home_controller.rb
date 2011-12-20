class HomeController < ApplicationController
  def index
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
    puts @sums


  end

end
