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

	# Get the quantity available in a given size
	def available_qty(size_id)
		case size_id
		when 1
			if self.inventory.xsmall > 0
				available = Array(1..self.inventory.xsmall)
			else
				available = []
			end
		when 2
			if self.inventory.small > 0
				available = Array(1..self.inventory.small)
			else
				available = []
			end
		when 3
			if self.inventory.medium > 0
				available = Array(1..self.inventory.medium)
			else
				available = []
			end
		when 4
			if self.inventory.large > 0
				available = Array(1..self.inventory.large)
			else
				available = []
			end
		when 5
			if self.inventory.xlarge > 0
				available = Array(1..self.inventory.xlarge)
			end
		when 6
			if self.inventory.xxlarge > 0
				available = Array(1..self.inventory.xxlarge)
			else
				available = []
			end
		end
	end

	def set_available_array
		max_qty = self.inventory.small
		i = 1
		while i <= max_qty
			
		end
	end

	private
		# If product is an apparel create an associated inventory
		def check_product_type
			if self.product_category_id == 1
				Inventory.create!(product_id: self.id, xsmall: 0, small: 0, medium: 0, large: 0, xlarge: 0, xxlarge: 0)
			end
		end

end
