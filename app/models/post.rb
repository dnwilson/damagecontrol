class Post < ActiveRecord::Base

	belongs_to :user

	validates :post_title, presence: true, length: {minimum: 3, maximum: 30}
	validates :post_content, presence: true
	validates_presence_of :user_id, message: "You must be a logged in admin to create a post"
end
