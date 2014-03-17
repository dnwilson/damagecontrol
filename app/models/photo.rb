class Photo < ActiveRecord::Base

	belongs_to :imageable, polymorphic: true

	has_attached_file :image, :styles => {large: "2048x20480>", med: "1024x1024>", thumb: "150x150#"},
	:default_url => "/assets/no-image.png", 
	:url => "/assets/photo/:id/:basename_:style.:extension",
	:path => ":rails_root/app/assets/images/photo/:id/:basename_:style.:extension"

	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
