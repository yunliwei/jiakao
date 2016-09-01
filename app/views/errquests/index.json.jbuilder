json.array!(@errquests) do |errquest|
  json.extract! errquest, :id, :amount
  json.url errquest_url(errquest, format: :json)
end
