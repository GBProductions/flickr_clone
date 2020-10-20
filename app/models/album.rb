class Album < ApplicationRecord
  has_one_attached :album_cover_photo
end