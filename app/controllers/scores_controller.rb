class ScoresController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

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
    # NOTE: rigth now this only works if we use ngrok to get a public url and update
    # the webhook here https://console.twilio.com/us1/develop/phone-numbers/manage/incoming/PN1c879659911f7f91eb7002c7e7a7c793/configure
    if params[:Body] # Handle incoming SMS from Twilio
      total, strikes, spares = extract_scores(params[:Body])
      if total && strikes && spares
        Score.create(total: total, strike: strikes, spare: spares)
      end
      head :ok # Respond with 200 status for Twilio
    else
      # Handle standard form submission
      @score = Score.new(score_params)
      if @score.save
        redirect_to @score, notice: "Score successfully created."
      else
        render :new
      end
    end
  end

  private
  def get_score
    @score = Score.find(params[:id])
  end

  def score_params
    params.require(:score).permit(:strike, :spare, :total)
  end

  def extract_scores(body)
    # Split the message into parts and convert to integers
    numbers = body.split.map(&:to_i)
  
    # Ensure exactly three numbers are provided
    return unless numbers.size == 3
  
    numbers
  end
end
