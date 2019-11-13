class Player < ApplicationRecord
  belongs_to :team
  validates :derby_name, presence: true
end
