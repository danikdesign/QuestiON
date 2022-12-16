class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @questions = Question.find_by id: params[id]
  end

  def new
    @question = Question.new
  end
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def update
    @question = Question.find_by id: params[:id]
    @question.update(question_params)
    redirect_to questions_path
  end

  def destroy
    @question = Question.find_by id: params[:id]
    @question.destroy
    redirect_to questions_path
  end

  private
  params.require(:question).permit(:title, :body)
end
