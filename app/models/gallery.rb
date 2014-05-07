class Gallery < ActiveRecord::Base
	belongs_to :user
	belongs_to :event
	has_many :photos, :dependent => :destroy

	accepts_nested_attributes_for :photos, allow_destroy: true

	validates :name, presence: true, length: {maximum: 40, minimum: 3}

	auto_html_for :description do
		html_escape
		image
		youtube(:width => 438, :height => 246)
		soundcloud(:maxwidth => '438')
		link :target => "_blank", :rel => "nofollow"
		simple_format
	end
end
