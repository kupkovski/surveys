require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'associations' do
    it { should belong_to(:survey) }
  end

  describe 'validations' do
    it { should validate_presence_of(:value) }
    it { should validate_inclusion_of(:value).in_range(0..1) }
  end
end
