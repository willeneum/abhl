class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
  	add_column "players", "password_digest", :string
  	remove_column "players", "hashed_pw"
  end
end
