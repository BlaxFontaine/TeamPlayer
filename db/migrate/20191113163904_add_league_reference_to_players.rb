class AddLeagueReferenceToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_reference :players, :league, foreign_key: true
  end
end
