class QuestionsController < ApplicationController
  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Added!"
      redirect_to "/"
    else
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end
end
