class Photo < ApplicationRecord
  has_many :photo_tags, dependent: :destroy
  has_many :tags, through: :photo_tags
end