class Answer < ApplicationRecord
  VALUES = {
    no: 0,
    yes: 1
  }.freeze

  belongs_to :survey
end
