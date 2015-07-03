class AddSlugsToPlayersAndTeams < ActiveRecord::Migration
  def change
  	add_column :players, :slug, :string
  	add_column :teams, :slug, :string

  	add_index :players, :slug, unique:true
  	add_index :teams, :slug, unique:true
  end
end
