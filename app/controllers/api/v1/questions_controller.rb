class Api::V1::QuestionsController < ApplicationController
  # Them csrf policy
  protect_from_forgery with: :null_session
  def index
    @questions = Question.all
    render json: @questions, status: :ok
  end

  def update_counter
    @questions = Question.find(params[:id])

    if params[:count_for] == 'like'
      @questions.update(likes_count: @questions.likes_count + 1)
    elsif params[:count_for] == 'dislike'
      @questions.update(dislikes_count: @questions.dislikes_count + 1)
    end

    render json: @questions, status: :ok
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      render json: { data: @question, status: 'success' }, status: :ok
    else
      render json: { data: @question.errors.full_messages, status: 'failure' }, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :tag)
  end
end
