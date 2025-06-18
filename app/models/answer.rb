class Answer < ApplicationRecord
  VALUES = {
    no: 0,
    yes: 1
  }.freeze

  belongs_to :survey

  validates :value, presence: true
  validates :value, inclusion: { in: 0..1 }
end
