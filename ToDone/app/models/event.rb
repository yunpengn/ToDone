class Event < ApplicationRecord
	validates :title, presence: true
	validates :time, presence: true
end
