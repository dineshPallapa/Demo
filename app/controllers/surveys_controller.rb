class SurveysController < ApplicationController
  before_action :find_deal
  before_action :find_survey, only: [:show,:edit,:update,:destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  def index

  end
  def new
    @survey = Survey.new
  end
  def create
    @survey = Survey.new(survey_params)
    @survey.deal_id = @deal.id
    @survey.user_id = current_user.id
    @survey.ip_address = request.remote_ip
    if @survey.save
      redirect_to deal_path(@deal)
    else
      render :new
    end
  end
  def show

  end
  def edit

  end
  def update
    @survey.ip_address = request.remote_ip
    if @survey.update(survey_params)
      redirect_to deal_path(@deal)
    else
      render :edit
    end

  end
  def destroy
    @survey.destroy
    redirect_to deal_path(@deal)
  end

  private
    def survey_params
      params.require(:survey).permit(:rating,:comment, :ip_address)
    end

    def find_deal
      @deal = Deal.find(params[:deal_id])
    end

    def find_survey
      @survey=Survey.find(params[:id])
    end
end
