class Event < ActiveRecord::Base

	has_one :gallery
	has_many :videos

	mount_uploader :flyer, ImageUploader

	validates :name, presence: true, uniqueness: {scope: :date}, length: {maximum: 40, minimum: 3}
	validates :flyer, presence: true
	validates :date, presence: true
	validates :venue, presence: true, length: {maximum: 30, minimum: 3}
	# validate :check_date
	validate :check_date_format



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

end
