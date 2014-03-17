class Post < ActiveRecord::Base
	include AutoHtml

	belongs_to :user

	has_attached_file :image, :styles => {:large => "2048x2048>", med: "1024x1024#", thumb: "150x150#"},
	:default_url => "/assets/no-image.png", 
	:url => "/assets/post/:id/:basename_:style.:extension",
	:path => ":rails_root/app/assets/images/post/:id/:basename_:style.:extension"

	validates :title, presence: true, length: {minimum: 3, maximum: 30}
	validates :body, presence: true
	validates_presence_of :user_id, message: "You must be a logged in admin to create a post"

	auto_html_for :body do
		html_escape
		image
		youtube(:width => 438, :height => 246)
		soundcloud(:maxwidth => '438')
		link :target => "_blank", :rel => "nofollow"
		simple_format
	end
end
