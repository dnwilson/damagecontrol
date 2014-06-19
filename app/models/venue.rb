class Venue < ActiveRecord::Base

	has_many :events

	validates :name, presence: true, length: {maximum: 30, minimum: 3}
end
