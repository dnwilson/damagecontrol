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
end
