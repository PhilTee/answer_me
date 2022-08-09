require "application_system_test_case"

class AnswersTest < ApplicationSystemTestCase
  setup do
    @question = Question.ordered.first
  end

  test "answering a question" do
    visit questions_url
    assert_selector "h1", text: "Questions"

    assert_equal 1, @question.answers.count

    click_on @question.title
    click_on "Answer"
    fill_in "answer_body", with: "Answer body text"
    click_on "Create Answer"

    assert_selector "div", text: "Answer body text"

    assert_equal 2, @question.answers.count
  end

  test "editing an answer" do
    visit questions_url
    assert_selector "h1", text: "Questions"

    click_on @question.title
    click_on "Edit", match: :first
    fill_in "answer_body", with: "This has been changed"
    click_on "Update Answer"

    assert_selector "div", text: "This has been changed"
  end

  test "delete an answer" do
    visit questions_url
    assert_selector "h1", text: "Questions"

    click_on @question.title
    assert_selector "div", text: @question.answers.first.body
    click_on "Delete", match: :first

    assert_no_selector "div", text: @question.answers.first.body
    assert @question.answers.empty?
  end
end