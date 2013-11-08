class Post < ActiveRecord::Base
	validates :body, presence: true
	validates :blurb, length: {minimum: 5}
	validates :title, length: {in: 6..150}
end
