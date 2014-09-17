class SearchesController < ApplicationController
  def index
    @questions = Question.basic_search(params[:search_query])
    @answers = Answer.basic_search(params[:search_query])
    @results = @questions + @answers
  end
end
