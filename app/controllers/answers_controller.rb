class AnswersController < ApplicationController

  def index
    @answers = Answer.all
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)

    if @answer.save
      flash[:notice] = 'You have successfully created an answer!'
      redirect_to question_path(@question)
    else
      @question = Question.find(params[:question_id])
      @answers = @question.answers
      flash.now[:notice] = "Your answer must be at least 50 characters long."
      render 'questions/show'
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:description).merge(question: Question.find(params[:question_id]))
  end
end
