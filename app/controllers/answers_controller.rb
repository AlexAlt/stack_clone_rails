class AnswersController < ApplicationController
  def index
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user
    if @answer.save
      flash[:notice] = "Added!"
      redirect_to user_question_path(@question.user, @question)
    else
      render :new
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
