class Product < ActiveRecord::Base
	
	belongs_to :product_category

	has_attached_file :image, :styles => {:thumb => "150x150#", med: "300x300#"},
	:default_url => "/assets/no-image.png", 
	:url => "/assets/shop/:id/:basename_:style.:extension",
	:path => ":rails_root/app/assets/images/shop/:id/:basename_:style.:extension"

	validates :name, presence: true, length: {minimum: 3}
	validates :description, presence: true
	validates :price, presence: true

	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	# validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
end
