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

  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = "Update Successful!"
      redirect_to user_question_path(@question.user, @question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to user_question_path(@question.user, @question)
  end

  def vote
    answer = Answer.find(params[:id])
    vote = Vote.create(voteable: answer, creator: current_user, vote: params[:vote])

    if vote.valid?
      flash[:notice] = "You're vote was counted"
    else
      flash[:notice] = "You can only vote once"
    end

    redirect_to :back
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
