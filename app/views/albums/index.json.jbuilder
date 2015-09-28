json.array!(@albums) do |album|
  json.extract! album, :id, :artist, :year, :title, :pressing, :label, :genre, :image, :tracklist, :country, :comment, :favorite
  json.url album_url(album, format: :json)
end
