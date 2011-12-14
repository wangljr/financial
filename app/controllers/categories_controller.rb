class CategoriesController < ApplicationController

  def index
    @income = Category.income.first
    @outlay = Category.outlay.first
  end

end
