class Video < ActiveRecord::Base
	belongs_to :event
	serialize :params

	# mount_uploader :image, ImageUploader

	validates :name, presence: true, uniqueness: {scope: :date}, length: {maximum: 40, minimum: 3}
	validates :date, presence: true
	validates :event_id, presence: true
	validate :check_date
	validate :check_date_format
	validate :valid_url?

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
			self.errors[:date] << "must be in the past." unless self.date < Date.today rescue false
		end

		def check_date_format
			self.errors[:date] << "must be a valid date" unless Date.parse(self.date) rescue false
		end

		def valid_url?
			youtube_video_regex = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/
			self.errors[:url] << "must be a valid youtube link." unless youtube_video_regex.match(self.url) rescue false
		end

end
