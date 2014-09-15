class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(questions_params)
    if @question.valid?
      redirect_to root_url, notice: "Thanks for sharing!"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(current_user)
    @question = Question.find(params[:id])
  end

private

  def questions_params
    params.require(:question).permit(:user_id, :title, :description)
  end
end
