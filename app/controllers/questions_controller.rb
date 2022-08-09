class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]

  def index
    @questions = Question.ordered
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      respond_to do |format|
        format.html { redirect_to questions_path, notice: "Your new question has been posted!" }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path, notice: "Updated your question"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_path, notice: "Your question has been deleted" }
      format.turbo_stream
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
