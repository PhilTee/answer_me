class AnswersController < ApplicationController
  before_action :set_question
  before_action :set_answer, only: %i[edit update destroy]

  def new
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.build(answer_params)

    if @answer.save
      respond_to do |format|
        format.html { redirect_to question_path(@question), notice: "Posted your answer!" }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params) && @answer.user_id == current_user.id
      redirect_to question_path(@question), notice: "Updated your answer"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @answer.user_id == current_user.id 
      @answer.destroy

      redirect_to @question, notice: "Your answer has been deleted"
    else
      redirect_to @question, alert: "You can only delete your own answers"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body).merge(user_id: current_user.id)
  end

  def set_answer
    @answer = @question.answers.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
