json.array!(@questions) do |question|
  json.extract! question, :id, :questionname, :isjudge, :questionimage, :voice, :driverlicensetype, :questiontype
  json.url question_url(question, format: :json)
end
