require 'rails_helper'

RSpec.describe "Surveys", type: :request do
  describe "GET /index" do
    fixtures :surveys, :answers

    it "renders a list of existing Surveys" do
      get "/surveys"
      expect(response).to have_http_status(:success)
      expect(response.body).to include(surveys(:first_survey).question)
      expect(response.body).to include(surveys(:second_survey).question)
    end
  end
end
