class ScoringStat < ActiveRecord::Base
	belongs_to :scorer, :class_name => "Player", :foreign_key => :scorer_id
	belongs_to :passer, :class_name => "Player", :foreign_key => :passer_id
	belongs_to :game
end
