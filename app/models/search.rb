class Search

  def self.perform(search_term)
    return [] if search_term.nil? || search_term.empty?

    questions = Question.where("title like ? or body like ?", "%#{search_term}%", "%#{search_term}%")
    question_answers = Answer.where("body like ?", "%#{search_term}%").collect(&:question)

    (questions + question_answers).sort.uniq
  end
end