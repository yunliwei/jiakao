json.array!(@users) do |user|
  json.extract! user, :id, :login, :password, :head, :studentid, :sex, :age, :idcard, :name, :money, :model, :Subject, :logintype, :loginnumber, :logintime, :status
  json.url user_url(user, format: :json)
end
