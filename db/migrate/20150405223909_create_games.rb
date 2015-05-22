class CreateGames < ActiveRecord::Migration
  def up
    create_table :games do |t|
    	t.integer "home_team"
    	t.integer "away_team"
      
    	t.string "location"
    	t.datetime "game_time"
      t.integer "home_score"
      t.integer "home_shots"
      t.integer "home_pim"
      t.integer "home_pp_goals"
      t.integer "home_pp_attempts"
      t.integer "home_sh_goals"
      t.integer "away_score"
      t.integer "away_shots"
      t.integer "away_pim"
      t.integer "away_pp_goals"
      t.integer "away_pp_attempts"
      t.integer "away_sh_goals"


      t.timestamps
    end

    #add_index :games, ["home_team_id", "away_team_id"]
    #add_index :games, "home_team_id"
    #add_index :games, "away_team_id"
  end

  def down
  	drop_table :games
  end
end
