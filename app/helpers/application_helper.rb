module ApplicationHelper
	def full_title(page_title)
		base_title = "Damage Control"
		@page_site_name = "Damage Control"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end  

	def money_helper(money)
		symbol = "$"
		price_in_cents = (money*100).round
	  	"#{symbol}#{money}" 
	end

	
	def fullname_helper(current_user)
		if current_user.first_name.present?
			"#{current_user.first_name} #{current_user.last_name}"
		else
			"User"
		end
	end

	def available_sizes(id)
		@item = Product.find(id)
		@array =[]
		if @item.inventory.xsmall > 0
			@array << ['xsmall', 'xsmall']
		end
		if @item.inventory.small > 0
			@array << ['small', 'small']
		end
		if @item.inventory.medium > 0
			@array << ['medium', 'medium']
		end
		if @item.inventory.large > 0
			@array << ['large', 'large']
		end
		if @item.inventory.xlarge > 0
			@array << ['xlarge', 'xlarge']
		end
		if @item.inventory.xxlarge > 0
			@array << ['xxlarge', 'xxlarge']
		end
		@array
	end

	def set_size(selected)
		case selected
		when 'XS'
			1
		when 'S'
			2
		when 'M'
			3
		when 'L'
			4
		when 'XL'
			5
		when 'XXL'
			6
		end
	end
end
