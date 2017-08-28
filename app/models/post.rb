class Post < ApplicationRecord
  mount_uploader :image, PostImageUploader

  include PgSearch

  pg_search_scope :search_by_title,
                  against: :title,
                  using: { tsearch: { prefix: true, any_word: true } }

end
