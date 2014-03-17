class Product < ActiveRecord::Base
	
	belongs_to :product_category

	has_one :inventory

	after_save :check_product_type

	has_attached_file :image, :styles => {:thumb => "150x150#", med: "300x300#"},
	:default_url => "/assets/no-image.png", 
	:url => "/assets/shop/:id/:basename_:style.:extension",
	:path => ":rails_root/app/assets/images/shop/:id/:basename_:style.:extension"

	validates :name, presence: true, length: {minimum: 3}
	validates :description, presence: true
	validates :price, presence: true
	validates :product_category_id, presence: true

	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	# validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]

	# def dec_inventory(size_id)
	# 	case size_id
	# 	when 1
	# 		self.inventory.update_attributes(xsmall: self.inventory.xsmall - 1)
	# 	when 2
	# 		self.inventory.update_attributes(small: self.inventory.small - 1)
	# 	when  3
	# 		self.inventory.update_attributes(medium: self.inventory.medium - 1)
	# 	when  4
	# 		self.inventory.update_attributes(large: self.inventory.large - 1)
	# 	when  5
	# 		self.inventory.update_attributes(xlarge: self.inventory.xlarge - 1)
	# 	when  6
	# 		self.inventory.update_attributes(xxlarge: self.inventory.xxlarge - 1)
	# 	end
	# end


	# def inc_inventory(qty, size_id)
	# 	case size_id
	# 	when  1
	# 		self.inventory.update_attributes(xsmall: self.inventory.xsmall + qty)
	# 	when  2
	# 		self.inventory.update_attributes(small: self.inventory.small + qty)
	# 	when  3
	# 		self.inventory.update_attributes(medium: self.inventory.medium + qty)
	# 	when  4
	# 		self.inventory.update_attributes(large: self.inventory.large + qty)
	# 	when  5
	# 		self.inventory.update_attributes(xlarge: self.inventory.xlarge + qty)
	# 	when  6
	# 		self.inventory.update_attributes(xxlarge: self.inventory.xxlarge + qty)
	# 	end
	# end

	# Check availability of product. If product is downloadable it should be 
	# available by default
	def in_stock?
		if self.downloadable?
			true
		elsif self.inventory.xsmall > 0 || self.inventory.xxlarge > 0 || 
			self.inventory.small > 0 || self.inventory.medium > 0 ||
			self.inventory.xlarge > 0 || self.inventory.large > 0
		 	true
		else 
			false
		end
	end


	# Get the available sizes and set them to an array for select box
	def available_sizes
		sizes =[]
		if self.inventory.xsmall > 0
			sizes << ['XS', 1]
		end
		if self.inventory.small > 0
			sizes << ['S', 2]
		end
		if self.inventory.medium > 0
			sizes << ['M', 3]
		end
		if self.inventory.large > 0
			sizes << ['L', 4]
		end
		if self.inventory.xlarge > 0
			sizes << ['XL', 5]
		end
		if self.inventory.xxlarge > 0
			sizes << ['XXL', 6]
		end
		sizes
	end

	private
		# If product is an apparel create an associated inventory
		def check_product_type
			if self.product_category_id == 1
				Inventory.create!(product_id: self.id, xsmall: 0, small: 0, medium: 0, large: 0, xlarge: 0, xxlarge: 0)
			end
		end

end
