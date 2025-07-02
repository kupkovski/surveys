class SurveysController < ApplicationController
  def index
    @surveys = Survey.includes(:answers).order(created_at: :desc)
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def survey_params
    params.require(:survey).permit(:question)
  end
end
