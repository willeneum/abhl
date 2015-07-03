class Post < ActiveRecord::Base

	validates :topic, :presence => true
	validates :desc, :presence => true

	self.per_page = 2

end
