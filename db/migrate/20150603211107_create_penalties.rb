class CreatePenalties < ActiveRecord::Migration
  def change
    create_table :penalties do |t|

    	t.string "infraction"

      t.timestamps null: false
    end
  end
end
