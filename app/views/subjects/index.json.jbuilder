json.array!(@subjects) do |subject|
  json.extract! subject, :id, :subject
  json.url subject_url(subject, format: :json)
end
