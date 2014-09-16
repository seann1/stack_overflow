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
      respond_to do |format|
        format.html {redirect_to root_url}
        format.js
      end
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Your answer has been deleted"
    redirect_to root_path
  end

private

  def answers_params
    params.require(:answer).permit(:user_id, :question_id, :description)
  end

end
