class AnswersController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @answer = @survey.answers.build
  end
end
