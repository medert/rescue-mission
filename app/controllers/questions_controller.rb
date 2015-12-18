class QuestionsController < ApplicationController
  def index
      @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order('created_at asc')
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question is created!"
      redirect_to questions_path
    else
      flash[:notice] = "Invalid input."
      render "new"
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    if @question.save
      flash[:notice] = "You have successfully updated your question!"
      redirect_to @question
    else
      flash.now[:notice] = "Invalid input."
      render 'edit'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    @answers = @question.answers
    @answers.destroy_all
    
    if @answers.empty?
      flash[:notice] = "You have successfully deleted your question!"
      redirect_to questions_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :creator_id)
  end
end
