class RemoveTeamReferenceFromPlayer < ActiveRecord::Migration[6.0]
  def change
    remove_reference :players, :team, index: true, foreign_key: true
  end
end
