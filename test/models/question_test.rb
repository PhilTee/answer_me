require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  test "questions must have a title and body to be valid" do
    question = Question.new

    refute question.valid?
    assert question.errors.include?(:title)
    assert question.errors.include?(:body)

    question.title = 'title'
    question.body = 'body'

    assert question.valid?
  end
end
