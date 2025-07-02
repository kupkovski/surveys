class Survey < ApplicationRecord
  has_many :answers

  validates :question, presence: true

  def positive_answers
    @positive_answers ||= answers.where(value: Answer::VALUES[:yes])
  end

  def negative_answers
    @negative_answers ||= answers.where(value: Answer::VALUES[:no])
  end

  def positive_answers_rate
    ((positive_answers.size.to_f / answers.size) * 100).truncate(2)
  end

  def negative_answers_rate
    ((negative_answers.size.to_f / answers.size)* 100).truncate(2)
  end
end
