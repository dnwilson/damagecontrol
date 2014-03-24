class Member < ActiveRecord::Base

	has_attached_file :photo, :styles => {large: "1024x1024>", med: "450x450>", small: "200x200#"},
	:default_url => "/assets/no-image.png", 
	:url => "/assets/member/:id/:basename_:style.:extension",
	:path => ":rails_root/app/assets/images/member/:id/:basename_:style.:extension"

	# validates :name, presence: true, length: {minimum: 3, maximum: 30}
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
