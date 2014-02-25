class Post < ActiveRecord::Base

	belongs_to :user

	validates :title, presence: true, length: {minimum: 3, maximum: 30}
	validates :body, presence: true
	validates_presence_of :user_id, message: "You must be a logged in admin to create a post"
end
