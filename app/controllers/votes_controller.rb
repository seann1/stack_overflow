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
    @vote_count = @answer.votes.count
    @vote = @user.votes.create(votes_params)
    if @vote_count < @answer.votes.count
      flash[:notice] = "Your vote has been added"
      respond_to do |format|
        format.html {redirect_to question_path(@question)}
        format.js
      end
    else
     flash[:notice] = "You have already voted on this"
     redirect_to question_path(@question)
    end
  end

  private

  def votes_params
    params.permit(:user_id, :answer_id)
  end

end
