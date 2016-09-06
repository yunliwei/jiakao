json.array!(@chapters) do |chapter|
  json.extract! chapter, :id, :chapter
  json.url chapter_url(chapter, format: :json)
end
