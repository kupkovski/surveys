require 'rails_helper'

RSpec.describe "Answers", type: :request do
  describe "GET /new" do
    fixtures :surveys, :answers

    let(:survey) { surveys(:first_survey) }

    it "renders the template properly" do
      get "/surveys/#{survey.id}/answers/new", as: :turbo_stream
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Yes')
      expect(response.body).to include('No')
    end
  end

  describe "POST /create" do
    fixtures :surveys, :answers

    let(:survey) { surveys(:first_survey) }

    context 'with valid params' do
      let(:params) do
        { answer: { value: 1 } }
      end

      it "creates a new answer" do
        expect do
          post "/surveys/#{survey.id}/answers/", as: :turbo_stream, params: params
          expect(response).to have_http_status(:ok)
        end.to change { survey.answers.count }.by(1)
        expect(survey.reload.answers.last.value).to eq 1
      end
    end

    context 'with invalid params' do
      let(:params) do
        { answer: { value: -1 } }
      end

      it "renders " do
        expect do
          post "/surveys/#{survey.id}/answers/", as: :turbo_stream, params: params
          expect(response).to have_http_status(:ok)
          expect(response.body).to include(">Value: is not included in the list")
        end.to_not change { survey.answers.count }
      end
    end

    context 'with no value as params' do
      let(:params) do
        { answer: { value: nil } }
      end

      it "renders " do
        expect do
          post "/surveys/#{survey.id}/answers/", as: :turbo_stream, params: params
          expect(response).to have_http_status(:ok)
        end.to_not change { survey.answers.count }
      end
    end
  end
end
