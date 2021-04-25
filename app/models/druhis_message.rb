class DruhisMessage < ApplicationRecord
  belongs_to :drug_history
  belongs_to :user

  validates :text, presence: true


end
