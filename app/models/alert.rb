class Alert < ApplicationRecord
  belongs_to :user

  validates :nickname, presence: true
  validates :train_id, presence: true
  validates :alert_time, presence: true
end
