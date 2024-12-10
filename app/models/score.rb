class Score < ApplicationRecord
  has_one :user_score, dependent: :destroy
  has_one :user, through: :user_score
end
