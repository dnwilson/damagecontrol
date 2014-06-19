class Photo < ActiveRecord::Base

	belongs_to :gallery, touch: true
	belongs_to :user

	mount_uploader :image, ImageUploader

	validates_presence_of :gallery_id
	# validates_presence_of :name
	validates_presence_of :image

	before_create :default_name

	def default_name
		# self.name ||= File.basename(image.filename, '.*').titleize if image
		self.name = "IMG#{self.gallery_id}#{self.id}" if image
	end
end
