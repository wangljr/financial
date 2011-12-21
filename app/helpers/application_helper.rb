module ApplicationHelper
  class Array
    def sum
      inject(0) do |sum, x|
        sum + x
      end
    end
  end
end
