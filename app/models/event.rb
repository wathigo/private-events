# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User',
                       foreign_key: 'creator_id'
  validates :creator_id, presence: true
  validates :title, presence: true
  validates :location, presence: true
  validates :date, presence: true
end
