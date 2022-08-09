require "test_helper"

class AnswerTest < ActiveSupport::TestCase
  test "answers must have a body and question to be valid" do
    answer = Answer.new

    refute answer.valid?
    assert answer.errors.include?(:body)
    assert answer.errors.include?(:question)

    answer.body = 'body'
    answer.question = questions(:second)

    assert answer.valid?
  end
end
