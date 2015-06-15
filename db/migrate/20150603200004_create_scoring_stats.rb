class CreateScoringStats < ActiveRecord::Migration
  def change
    create_table :scoring_stats do |t|
    	t.integer "game_id"
    	t.integer "scorer_id"
    	t.integer "passer_id"
    	

    	t.integer "period"
    	t.time "time"

      t.timestamps null: false
    end

  end
end
