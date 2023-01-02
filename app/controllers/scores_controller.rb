class ScoresController < ApplicationController
  before_action :get_score, except: [:index]
  def index
    @scores = Score.all
  end 

  def show
  end
  private
  def get_score
    @score = Score.find(params[:id])
  end
end
