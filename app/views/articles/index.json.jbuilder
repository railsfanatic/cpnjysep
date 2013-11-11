json.array!(@articles) do |article|
  json.extract! article, :title, :permalink, :content, :published_at
  json.url article_url(article, format: :json)
end
