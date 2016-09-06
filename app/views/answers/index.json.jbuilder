json.array!(@answers) do |answer|
  json.extract! answer, :id, :asnwer, :isright
  json.url answer_url(answer, format: :json)
end
