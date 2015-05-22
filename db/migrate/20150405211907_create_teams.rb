class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string "name", :limit => 50
    	t.string "manager"
    	t.integer "payroll"
    	

      t.timestamps
    end
  end
end
