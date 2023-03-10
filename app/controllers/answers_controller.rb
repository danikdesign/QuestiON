class AnswersController < ApplicationController
  before_action :set_question!, :set_answer!

  def create
    @answer = @question.answers.build answer_params

    if @answer.save
      flash[:success] = "Answer created!"
      redirect_to question_path(@question)
    else
      @answers = Answer.order created_at: :desc
      render 'questions/show'
    end
  end

  def edit
  end

  def update

    if @answer.update answer_params
      redirect_to question_path(@question)
    else
      @answers = Answer.order created_at: :desc
      render :edit
    end

  end

  def destroy
    answer = @question.answers.find params[:id]
    answer.destroy
    flash[:success] = "Answer deleted!"

    redirect_to question_path(@question)
  end

  private
  def set_question!
    @question = Question.find params[:question_id]
  end

  def set_answer!
    @answer = @question.answers.find params[:id]
  end
  def answer_params
    params.require(:answer).permit(:body)
  end
end

