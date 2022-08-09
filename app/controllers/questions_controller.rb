class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_question, only: %i[show edit update destroy]

  def index
    if params[:search].present?
      @questions = Search.perform(params[:search])
    else
      @questions = Question.ordered
    end
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
    @answers = @question.answers.ordered
  end

  def edit
  end

  def update
    if @question.update(question_params) && @question.user_id == current_user.id
      redirect_to questions_path, notice: "Updated your question"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @question.user_id == current_user.id
      @question.destroy

      respond_to do |format|
        format.html { redirect_to questions_path, notice: "Your question has been deleted" }
        format.turbo_stream
      end
    else
      redirect_to questions_path, alert: "You can only delete your owns questions"
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body).merge(user_id: current_user.id)
  end
end
