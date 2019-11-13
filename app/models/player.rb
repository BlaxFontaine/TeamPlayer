class Player < ApplicationRecord
  belongs_to :league
  validates :derby_name, presence: true
end
