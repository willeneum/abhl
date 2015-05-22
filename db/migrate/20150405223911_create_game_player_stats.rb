class CreateGamePlayerStats < ActiveRecord::Migration
  def change
    create_table :game_player_stats do |t|
    	t.integer "player_id"
    	t.integer "game_id"

    	t.integer "goals"
    	t.integer "assists"
    	t.integer "points"
    	t.integer "pims"

      t.timestamps null: false
    end

    add_index :game_player_stats, ["game_id", "player_id"]
  end
end
