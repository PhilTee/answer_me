require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  setup do
    @question = Question.ordered.first
  end

  test "asking a new question" do
    visit questions_url
    login_user(users(:one).email)

    assert_selector "h1", text: "Questions"

    click_on "Ask a question"

    fill_in "question_title", with: "Isn't automated testing GREAT?"
    fill_in "question_body", with: "I like keeping errors out of the hands of customers. Why do you like it so much?"
    click_on "Ask this question"

    assert_selector "h1", text: "Questions"
    assert_text "Isn't automated testing GREAT?"

    click_button 'Log out'
  end

  test "viewing a question" do
    visit questions_url
    login_user(users(:one).email)

    assert_selector "h1", text: "Questions"

    click_on @question.title
    assert_selector "h1", text: @question.title

    click_button 'Log out'
  end

  test "editing a question" do
    visit questions_url
    login_user(users(:one).email)

    assert_selector "h1", text: "Questions"

    click_on "Edit", match: :first
    fill_in "question_title", with: "I changed this"
    click_on "Update my question"

    assert_selector "h1", text: "Questions"
    assert_text "I changed this"

    click_button 'Log out'
  end

  test "question owners can delete on of their questions" do
    visit questions_url
    login_user(users(:two).email)

    assert_selector "h1", text: "Questions"
    assert_text @question.title

    click_on "Delete", match: :first
    assert_no_text @question.title

    click_button 'Log out'
  end
end
