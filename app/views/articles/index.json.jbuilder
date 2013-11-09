json.array!(@articles) do |article|
  json.extract! article, :title, :permalink, :content, :published
  json.url article_url(article, format: :json)
end
