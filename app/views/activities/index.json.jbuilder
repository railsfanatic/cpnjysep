json.array!(@activities) do |activity|
  json.extract! activity, :title, :starts_at, :length_in_minutes, :description
  json.url activity_url(activity, format: :json)
end
