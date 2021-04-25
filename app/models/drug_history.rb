class DrugHistory < ApplicationRecord
  belongs_to :user
  has_many :druhis_messages, dependent: :destroy

  validates :start_time, presence: true
end
