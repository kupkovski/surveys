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

  describe "GET /show" do
    fixtures :surveys, :answers
    let(:survey) { surveys(:first_survey) }

    it "renders a list of existing Surveys" do
      get "/surveys/#{survey.id}"
      expect(response).to have_http_status(:success)
      expect(response.body).to include(survey.question)
      expect(response.body).to include(survey.answers.size.to_s)
      expect(response.body).to include(survey.positive_answers.size.to_s)
      expect(response.body).to include(survey.negative_answers.size.to_s)
    end
  end

  describe 'GET /new' do
    it "renders a new page with a form for creating a new survey" do
      get "/surveys/new"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Create a new survey")
      expect(response.body).to include("Question")
      expect(response.body).to include("Create Survey")
    end
  end

  describe 'GET /create' do
    context 'with invalid params' do
      let(:params) do
        { survey: { question: "" } }
      end

      it "does not save the survey and shows the errors" do
        expect do
          post "/surveys/", params: params
        end.to_not change { Survey.count }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("1 error prohibited this survey from being saved")
      end
    end

    context 'with valid params' do

      let(:params) do
        { survey: { question: "Just a testing fake survey" } }
      end

      it "creates a new survey and redirects to root" do
        expect do
          post "/surveys/", params: params
        end.to change { Survey.count }.by(1)

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to root_path
      end
    end
  end
end
