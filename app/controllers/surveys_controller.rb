class SurveysController < ApplicationController
  def index
    # @surveys = Survey.joins(:answers).group('answers.survey_id').count#.order(created_at: :desc)
    @surveys = Survey.includes(:answers).order(created_at: :desc)
  end
end
