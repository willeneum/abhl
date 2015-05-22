class CreatePlayers < ActiveRecord::Migration
  def up
    create_table :players do |t|
      t.integer "team_id"

    	t.string "first_name", :limit => 25
    	t.string "last_name", :limit => 50
    	t.string "email", :null => false
      t.string "hashed_pw", :limit => 40
    	t.string "cell"
      t.integer "salary"
      t.boolean "admin", :default => false

      t.timestamps 
    end

    add_index :players, "team_id"
  end

  def down
    drop_table :players
  end
end
