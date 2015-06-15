class CreatePenaltyStats < ActiveRecord::Migration
  def change
    create_table :penalty_stats do |t|
			t.integer "game_id"
    	t.integer "player_id"
    	t.integer "penalty_id"

    	t.integer "period"
    	t.time "time"

      t.timestamps null: false
    end
  end
end
