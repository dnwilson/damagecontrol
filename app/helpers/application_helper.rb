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

	def cents_helper(cents)
		symbol = "$"
		price_in_dollars = (cents/100)
	  	"#{symbol}#{price_in_dollars}.00" 
	end

	
	def fullname_helper(current_user)
		if current_user.first_name.present?
			"#{current_user.first_name} #{current_user.last_name}"
		else
			"User"
		end
	end

	def fb_path(name)
		"http://facebook.com/#{name}"
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


	def authorized?
		if signed_in?
			if current_user.admin?
				true
			end
		else
			false
		end
	end

	def set_size(selected)
		case selected
		when 1
			'XS'
		when 2
			'S'
		when 3
			'M'
		when 4
			'L'
		when 5
			'XL'
		when 6
			'XXL'
		end
	end

	def season(event)
		item = event.date
		day_hash = item.month * 100 + item.day
		case day_hash
			when 101..401 then "winter"
			when 401..630 then "spring"
			when 701..930 then "summer"
			when 1001..1231 then "fall"
		end
	end

	def states_list
		list = [['Alabama', 'Alabama'], ['Alaska', 'Alaska'], ['Arizona', 'Arizona'], ['Arkansas', 'Arkansas'], ['California', 'California'], ['Colorado', 'Colorado'], ['Connecticut', 'Connecticut'], ['Delaware', 'Delaware'], ['District Of Columbia', 'District Of Columbia'], ['Florida', 'Florida'], ['Georgia', 'Georgia'], ['Hawaii', 'Hawaii'], ['Idaho', 'Idaho'], ['Illinois', 'Illinois'], ['Indiana', 'Indiana'], ['Iowa', 'Iowa'], ['Kansas', 'Kansas'], ['Kentucky', 'Kentucky'], ['Louisiana', 'Louisiana'], ['Maine', 'Maine'], ['Maryland', 'Maryland'], ['Massachusetts', 'Massachusetts'], ['Michigan', 'Michigan'], ['Minnesota', 'Minnesota'], ['Mississippi', 'Mississippi'], ['Missouri', 'Missouri'], ['Montana', 'Montana'], ['Nebraska', 'Nebraska'], ['Nevada', 'Nevada'], ['New Hampshire', 'New Hampshire'], ['New Jersey', 'New Jersey'], ['New Mexico', 'New Mexico'], ['New York', 'New York'], ['North Carolina', 'North Carolina'], ['North Dakota', 'North Dakota'], ['Ohio', 'Ohio'], ['Oklahoma', 'Oklahoma'], ['Oregon', 'Oregon'], ['PALAU', 'PALAU'], ['Pennsylvania', 'Pennsylvania'], ['PUERTO RICO', 'PUERTO RICO'], ['Rhode Island', 'Rhode Island'], ['South Carolina', 'South Carolina'], ['South Dakota', 'South Dakota'], ['Tennessee', 'Tennessee'], ['Texas', 'Texas'], ['Utah', 'Utah'], ['Vermont', 'Vermont'], ['Virginia', 'Virginia'], ['Washington', 'Washington'], ['West Virginia', 'West Virginia'], ['Wisconsin', 'Wisconsin'], ['Wyoming', 'Wyoming'], ['Canada', 'Canada']]
	end

	def youtube_embed(link)
		youtube_video_regex = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/
		youtube_video = youtube_video_regex.match(link)[2]
		url = "http://www.youtube.com/embed/#{youtube_video}"
		url
	end

end
