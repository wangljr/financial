class CategoriesController < ApplicationController
  respond_to :html, :js

  def index
    @income = Category.income.first
    @outlay = Category.outlay.first
  end

  def new
    @category = Category.new
  end

  def cate
    if params[:id] == 1
      @options = Category.income.first.categories
    else
      @options = Category.outlay.first.categories
    end
  end
end
