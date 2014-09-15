class AnswersController < ApplicationController

  def index
    @answers = Answer.all
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.create(answers_params)
    if @answer.valid?
      redirect_to root_url, notice: "Thanks for sharing!"
    else
      render 'new'
    end
  end

private

  def answers_params
    params.require(:answer).permit(:user_id, :question_id, :description)
  end

end
