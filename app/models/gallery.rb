class Gallery < ActiveRecord::Base
	belongs_to :user
	belongs_to :event
	has_many :photos, :dependent => :destroy

	accepts_nested_attributes_for :photos, allow_destroy: true

	validates :name, presence: true, uniqueness: {scope: :date}, length: {maximum: 40, minimum: 3}
	validates :date, presence: true
	validate :check_date
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
			self.errors[:date] << "must be in the past." unless self.date < Date.today rescue false
		end

		def check_date_format
			self.errors[:date] << "must be a valid date" unless Date.parse(self.date) rescue false
		end

end
