json.array!(@progres) do |progre|
  json.extract! progre, :id
  json.url progre_url(progre, format: :json)
end
