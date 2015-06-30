class Post < ActiveRecord::Base

	validates :topic, :presence => true
	validates :desc, :presence => true

end
