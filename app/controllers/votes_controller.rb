class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    @vote = Vote.new

  end

  def create
    @user = User.find(current_user)
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    @vote = @user.votes.create(votes_params)
      flash[:notice] = "Your vote has been added"
      redirect_to question_path(@question)
  end

  private

  def votes_params
    params.permit(:user_id, :answer_id)
  end

end
