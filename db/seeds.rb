# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.create(name: 'Tigers');
Team.create(name: 'SHJB');
Team.create(name: 'Cash');
Team.create(name: 'Roosters');
Team.create(name: 'Shockers');
Team.create(name: 'Chain');


Player.create(first_name: 'Will', last_name: 'Chan', email: 'wchan@abhl.com')
Player.create(first_name: 'Felix', last_name: 'Wong', email: 'fwong@abhl.com')
Player.create(first_name: 'Ryan', last_name: 'Ho', email: 'rho@abhl.com')
Player.create(first_name: 'Ryan', last_name: 'Tong', email: 'rtong@abhl.com')
Player.create(first_name: 'James', last_name: 'Fong', email: 'jfong@abhl.com')
Player.create(first_name: 'Hon', last_name: 'Yee', email: 'hyee@abhl.com')
Player.create(first_name: 'Dan', last_name: 'Mah', email: 'dmah@abhl.com')
Player.create(first_name: 'Bern', last_name: 'Chu', email: 'bchu@abhl.com')


Game.create(home_team_id: 1, away_team_id: 3);
Game.create(home_team_id: 2, away_team_id: 4);
Game.create(home_team_id: 6, away_team_id: 5);


Penalty.create(infraction: 'High-Sticking');
Penalty.create(infraction: 'Tripping');
Penalty.create(infraction: 'Hooking');
Penalty.create(infraction: 'Delay of Game');
Penalty.create(infraction: 'Holding');
Penalty.create(infraction: 'Interference');