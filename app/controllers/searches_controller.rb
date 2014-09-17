class SearchesController < ApplicationController
  def index
    @questions = Question.basic_search(params[:search_query])
  end
end
