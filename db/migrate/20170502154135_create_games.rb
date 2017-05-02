class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :date_played
      t.integer :opponent_score
      t.integer :own_score

      t.timestamps null: false
    end
  end
end
