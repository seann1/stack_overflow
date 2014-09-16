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
      respond_to do |format|
        format.html {redirect_to root_url}
        format.js
      end
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(:question_id => @question.id).flatten
    @answers = Question.sort_by_choice(@answers)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(questions_params)
      respond_to do |format|
        format.html {redirect_to root_url}
        format.js
      end
    flash[:notice] = "Your question has been updated"
    else
      redirect_to edit_question_path(@question)
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Your question has been deleted"
    redirect_to root_path
  end


private

  def questions_params
    params.require(:question).permit(:user_id, :title, :description)
  end
end
