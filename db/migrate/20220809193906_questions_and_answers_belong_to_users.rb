class QuestionsAndAnswersBelongToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :user, index: true
    add_foreign_key :answers, :users

    add_reference :questions, :user, index: true
    add_foreign_key :questions, :users
  end
end
