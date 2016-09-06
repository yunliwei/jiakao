json.array!(@scores) do |score|
  json.extract! score, :id, :score
  json.url score_url(score, format: :json)
end
