# frozen_string_literal: true

class User < ApplicationRecord
  has_many  :hosting_events, class_name: 'Event',
                             foreign_key: 'creator_id',
                             dependent: :destroy
  validates :name,    presence: true
  validates :email,   presence: true
  before_create :generate_token

  def generate_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def update_token
    update_attribute(:remember_token, remember_token)
  end

  def authenticated?(token)
    token == remember_token
  end
end
