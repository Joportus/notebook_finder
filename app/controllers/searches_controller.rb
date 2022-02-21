class SearchesController < ApplicationController

  def add_dots(num_string)
    num_string.reverse.scan(/\d{3}|.+/).join(".").reverse
  end

  def new
    @search = Search.new
    budgets = []
    budget = 50_000
    100.times do
      budgets << ['$'+add_dots(budget.to_s), budget]
      budget += 50_000
    end
    @budgets = budgets
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:budget, :use_case)
  end


end
