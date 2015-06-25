class AddPasswordDigestToUsers < ActiveRecord::Migration
  def up
  	add_column "players", "password_digest", :string
  	remove_column "players", "hashed_pw"
  end

  def down
  	remove_column "players", "password_digest"
  	add_column "players", "hashed_pw", :string
  end
end
