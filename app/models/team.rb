class Team < ApplicationRecord
  belongs_to :league
  has_many :players, through: :league
  validates :name, presence: true
end
