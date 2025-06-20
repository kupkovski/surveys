class Answer < ApplicationRecord
  VALUES = { no: 0, yes: 1 }.freeze

  belongs_to :survey

  validates :value, presence: true
  validates :value, inclusion: { in: 0..1 }

  after_create_commit { create_broadcast }

  private

  def create_broadcast
    total_answers = survey.reload.answers.size
    positive_answers_total = survey.positive_answers.size
    positive_answers_rate = survey.positive_answers_rate
    negative_answers_total = survey.negative_answers.size
    negative_answers_rate = survey.negative_answers_rate

    broadcast_update_to "total_answers",
      partial: "surveys/total_answers",
      locals: { total_answers: },
      target: "#{survey.id}_total_answers"

    broadcast_update_to "positive_answers_rate",
      partial: "surveys/positive_answers_rate",
      locals: { positive_answers_total:, positive_answers_rate: },
      target: "#{survey.id}_positive_answers_rate"

    broadcast_update_to "total_answers",
      partial: "surveys/negative_answers_rate",
      locals: { negative_answers_total:, negative_answers_rate: },
      target: "#{survey.id}_negative_answers_rate"
  end
end
