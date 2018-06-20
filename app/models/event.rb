class Event < ApplicationRecord
  belongs_to :category
  validates :title, presence: true
  validates :time, presence: true
end
