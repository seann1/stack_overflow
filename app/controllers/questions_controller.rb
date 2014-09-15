class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @user = User.find(params[:user_id])
    @photo = Photo.create(user_params)
    if @photo.valid?
      session[:photo_id] = @photo.id
      redirect_to user_path(@user), notice: "Thanks for sharing!"
    else
      render 'new'
    end
  end

private

  def questions_params
    params.require(:question).permit(:user_id, :title, :description).merge(:user_id => current_user.id)
  end
end
