class Person < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, :bio, :schedule, presence: true
end
