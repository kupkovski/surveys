require 'rails_helper'

RSpec.describe Survey, type: :model do
  describe 'associations' do
    it { should have_many(:answers) }
  end

  describe 'validations' do
    it { should validate_presence_of(:question) }
  end

  describe 'positive_answers' do
    fixtures :surveys, :answers
    subject { surveys(:first_survey) }

    it 'returns only answers with value 1 (yes)' do
      expect(subject.positive_answers).to eq([ answers(:yes_answer_to_first_survey) ])
    end
  end

  describe 'negative_answers' do
    fixtures :surveys, :answers
    subject { surveys(:first_survey) }

    it 'returns only answers with value 0 (no)' do
      expect(subject.negative_answers).to eq([ answers(:no_answer_to_first_survey) ])
    end
  end

  describe 'positive_answers_rate' do
    context 'when there are no answers' do
      subject { Survey.new }

      it 'returns 0' do
        expect(subject.positive_answers_rate).to eq 0
      end
    end

    context 'when there are answers' do
      fixtures :surveys, :answers
      subject { surveys(:first_survey) }

      it 'returns proportion of answers containing YES value' do
        expect(subject.positive_answers_rate).to eq 50.0 # 50% of answers are YES on the fixtures
      end
    end
  end

  describe 'negative_answers_rate' do
    context 'when there are no answers' do
      subject { Survey.new }

      it 'returns 0' do
        expect(subject.negative_answers_rate).to eq 0
      end
    end

    context 'when there are answers' do
      fixtures :surveys, :answers
      subject { surveys(:first_survey) }

      it 'returns proportion of answers containing NO value' do
        expect(subject.negative_answers_rate).to eq 50.0 # 50% of answers are NO on the fixtures
      end
    end
  end
end
