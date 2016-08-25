class Article::Post::FeaturedImageUploader < ImageUploader
  process resize_to_fill: [1280, 720]

  version :small do
    process resize_to_fill: [640, 360]
  end
end
