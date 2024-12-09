class ScoresController < ApplicationController
  before_action :authenticate_user!
  # TODO IAN the line above got devise working so we are gonna need to get the  views styled
  # probably in a new view
  before_action :get_score, except: [:index,:new,:create]
  def index
    @scores = Score.all.order(total: :desc)
  end 

  def show
  end

  def new
    @score = Score.new
  end

  def create
    @score = Score.new(score_params)
    if @score.save
      redirect_to @score
    else
      render :new
    end
  end

  private
  def get_score
    @score = Score.find(params[:id])
  end
  def score_params
    params.require(:score).permit(:strike, :spare, :total)
  end
end
