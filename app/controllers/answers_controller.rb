class AnswersController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :load_survey

  def new
    @answer = @survey.answers.build
  end

  def create
    @answer = @survey.answers.build(answer_params)
    respond_to do |format|
      if @answer.save
        format.turbo_stream { }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            "#{dom_id(@answer)}_errors",
              partial: "answers_errors", locals: { answer: @answer }
            )
        end
      end
    end
  end

  private

  def load_survey
    @survey = Survey.find(params[:survey_id])
  end

  def answer_params
    # a workaround to prevent getting a non-empty answer object with empty content,
    # which ends up causing ActionController::ParameterMissing
    params.fetch(:answer, Hash.new).permit(:value)
  end
end
