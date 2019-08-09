# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator,       class_name: 'User',
                             foreign_key: 'creator_id'

  has_many  :attendancies,   class_name: 'Attendance',
                             foreign_key: 'attended_event_id',
                             dependent: :destroy
  has_many :attendees, through: :attendancies, source: :attendee
  validates :creator_id, presence: true
  validates :title, presence: true
  validates :location, presence: true
  validates :date, presence: true
end
