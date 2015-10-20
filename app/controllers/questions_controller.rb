class QuestionsController < ApplicationController
  def index
  end

  def show
    @question = Question.find(params[:id])
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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    if question.update(question_params)
      flash[:notice] = "Edit successful!"
      redirect_to user_question_path(question, current_user)
    else
      render :edit
    end
  end

  def vote
    question = Question.find(params[:id])
    vote = Vote.create(voteable: question, creator: current_user, vote: params[:vote])

    if vote.valid?
      flash[:notice] = "You're vote was counted"
    else
      flash[:notice] = "You can only vote once"
    end

    redirect_to :back
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to "/"
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end
end
