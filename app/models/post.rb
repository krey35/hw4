class Post < ApplicationRecord
    has_one_attached :uploaded_image #or "uploaded_image"
end
