class Event < ActiveRecord::Base

	has_one :gallery
	has_many :videos
	belongs_to :venue

	after_create :add_gallery

	mount_uploader :flyer, ImageUploader

	validates :name, presence: true, uniqueness: {scope: :date}, length: {maximum: 40, minimum: 3}
	validates :flyer, presence: true
	validates :date, presence: true
	validates :venue_id, presence: true
	# validate :check_date
	validate :check_date_format

	default_scope {order('date DESC')}

	auto_html_for :description do
		html_escape
		image
		youtube(:width => 438, :height => 246)
		soundcloud(:maxwidth => '438')
		link :target => "_blank", :rel => "nofollow"
		simple_format
	end

	private
		def check_date
			self.errors[:date] << "must be in the future." unless self.date > Date.today rescue false
		end

		def check_date_format
			self.errors[:date] << "must be a valid date" unless Date.parse(self.date) rescue false
		end

		def add_gallery
			Gallery.create!(name: name, date: date, preview_pic: flyer, event_id: id)
		end

end
