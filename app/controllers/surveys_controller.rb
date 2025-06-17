class SurveysController < ApplicationController
  def index
    @surveys = Survey.includes(:answers).order(created_at: :desc)
  end

  def show
    @survey = Survey.find(params[:id])
  end
end
